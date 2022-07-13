import 'package:flutter/material.dart';

import '../../../Model/Team.dart';
import '../../../Service/NotificationService.dart';
import '../../../Service/TeamService.dart';
import '../../../constants.dart';
import '../../../variables.dart';
import '../Bookmark/bookmarkScreen.dart';
import '../Match/MatchScreen.dart';
import '../Match/widgets/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChallengeFootballTeamsScreen extends StatefulWidget {
  const ChallengeFootballTeamsScreen({Key? key}) : super(key: key);

  @override
  _ChallengeFootballTeamsScreenState createState() =>
      _ChallengeFootballTeamsScreenState();
}

class _ChallengeFootballTeamsScreenState
    extends State<ChallengeFootballTeamsScreen> {

  late SharedPreferences prefs;
  late String id = "";
  late   List<Team> teams = [];
  late Future<bool> fetchedTeams;

  Future<bool> fetchTeam() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    var test= await TeamService().getTeams(id);
    print("Ena teams"+teams.toString());

    test?.forEach((element) {

      teams.add(element);

    });

    setState(() {

    });
    return true;
  }



  @override
  void initState() {
    fetchedTeams = fetchTeam();
    super.initState();
  }

  bool onClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [themeColor, Colors.black])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(selectedSport == "tennis"
                  ? Icons.sports_tennis
                  : Icons.sports_soccer),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MatchScreen()));
              },
            ),
            title: Text(
              "SportPal",
              style: TextStyle(fontSize: appBarTitleSize),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.bookmark_sharp),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookmarkScreen()));
                },
              ),
              IconButton(
                icon: Icon(Icons.person_search),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => TennisFilter()));
                },
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: FutureBuilder(
              future: fetchedTeams ,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if(snapshot.hasData) {
                  return ListView.builder(
                      itemCount: teams.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: double.infinity,
                          height: 210,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color.fromRGBO(128, 128, 128, 0.2)),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white70),
                          margin: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0, top: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.green, width: 2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  teams[index].picture!))),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          teams[index].name!.toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1),
                                        ),
                                        SizedBox(height: 6,),
                                        Text(
                                          "victories : 74",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: RatingBar(
                                        rating: 5,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Match history",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "Osasuna 1 - 3 Real Madrid",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          "Seville 2 - 3 Real Madrid",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 4,),
                                        InkWell(
                                          onTap: (){
                                            //TODO thezek lel historique mtaa matchouet mtaa jameeya selected
                                          },
                                          child: Text(
                                            "click to check more",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 8.0, right: 8),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() {
                                            onClicked = true;
                                          });
                                          var resultat = await NotificationService().friendRequest(id,
                                              teams[index].captain!.id!);
                                          print(resultat);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: onClicked? Colors.grey : themeColor,
                                              borderRadius: BorderRadius.circular(12)),
                                          child: Text(
                                            onClicked ? "CHALLENGED" : "Challenge",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }
                else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
          )
      ),
    );
  }
}
