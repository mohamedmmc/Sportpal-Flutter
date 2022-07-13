import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';
import 'package:sportpal/Controller/screens/tournement/createTournement.dart';
import 'package:sportpal/Model/Tournament.dart';
import 'package:sportpal/Service/TournamentService.dart';
import '../../../constants.dart';
import '../../../variables.dart';
import '../Friends/friendsListScreen.dart';
import 'TournamentDetailsScreen.dart';

class TournementScreenList extends StatefulWidget {
  const TournementScreenList({Key? key}) : super(key: key);

  @override
  _TournementScreenListState createState() => _TournementScreenListState();
}

class _TournementScreenListState extends State<TournementScreenList> {
  late List<Tournament> tournament = [];
  late Future<bool> fetchedTournament;

  Future<bool> fetchUser() async {
    var list = await TournamentService().getTournament(tournament);
    print(list);
    setState(() {});
    return true;
  }

  @override
  void initState() {
    fetchedTournament = fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateTournementScreen()));
              },
              icon: Icon(Icons.add))
        ],
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text(
          "Tournements",
          style: TextStyle(fontSize: appBarTitleSize),
        ),
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(8),
        child: FutureBuilder(
            future: fetchedTournament,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: tournament.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 220,
                        margin: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.grey,
                                offset: Offset(0, 6),
                              ),
                            ]),
                        child: InkWell(
                          onTap: () {
                            //todo show tournament details
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TournamentDetailsScreen(
                                            tournement: tournament[index])));
                          },
                          splashColor: Colors.blue[200],
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          tournament[index].title.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: themeColor,
                                              letterSpacing: 2,
                                              fontFamily: 'Product-Sans'),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "In " +
                                              /*tournament[index].place.toString()*/
                                              tournament[index]
                                                  .place!
                                                  .name
                                                  .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              tournament[index].participants !=
                                                      null
                                                  ? Text(
                                                      'nbr players :' +
                                                          tournament[index]
                                                              .participants!
                                                              .length
                                                              .toString() +
                                                          '/' +
                                                          tournament[index]
                                                              .numberOfParticipants!
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : Text(
                                                      'nbr players : 0 /' +
                                                          tournament[index]
                                                              .numberOfParticipants!
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'From : ' +
                                                    tournament[index]
                                                        .from
                                                        .toString()
                                                        .substring(0, 10) +
                                                    "   To : " +
                                                    tournament[index]
                                                        .to
                                                        .toString()
                                                        .substring(0, 10),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 250,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[350],
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 3,
                                              ),
                                              child: Text(
                                                tournament[index]
                                                        .prize
                                                        .toString() +
                                                    " dt",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: themeColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
