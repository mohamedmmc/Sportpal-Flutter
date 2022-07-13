import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';
import 'package:sportpal/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Model/Matche.dart';
import '../../../../Model/Player.dart';
import '../../../../Service/MatchService.dart';
import '../../../../constants.dart';
import 'MatchCardWidget.dart';



class TennisMatchHistoryList extends StatefulWidget {
  const TennisMatchHistoryList({Key? key}) : super(key: key);

  @override
  _TennisMatchHistoryListState createState() => _TennisMatchHistoryListState();
}

class _TennisMatchHistoryListState extends State<TennisMatchHistoryList> {
  late Future<bool> fetchedUser;
  late String id;
  final List<Matche> matchs = [];
  final List<Player> adversaires = [];
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;

    var test = await MatchService().getMatchs(id);


    test?.forEach((element) {

      matchs.add(element);
      if(id != element.teamA!.players[0]!.id!){
        adversaires.add(element.teamA!.players[0]!);
      }else if (id != element.teamB!.players[0]!.id!){
        adversaires.add(element.teamB!.players[0]!);
      }

    });


    setState(() {});

    return true;
  }

  @override
  void initState() {

    fetchedUser = fetchUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Match History 1",
          style: TextStyle(
              fontSize: appBarTitleSize
          ),
        ),
        centerTitle: true,
        leading: MenuWidget(),
        backgroundColor: themeColor,
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(8),
        child: FutureBuilder(
            future: fetchedUser ,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                    itemCount: matchs.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return TennisMatchCard(match: matchs[index],adversaire: adversaires[index],);
                    });
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        )
      )
    );
  }
}
