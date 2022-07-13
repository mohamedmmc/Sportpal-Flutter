import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/Match/widgets/common_widgets.dart';
import 'package:sportpal/Controller/screens/Messanger/ChatScreen.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';
import 'package:sportpal/Service/TeamService.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/Team.dart';
import '../../../Service/NotificationService.dart';

class JoinFootballTeamsScreen extends StatefulWidget {
  const JoinFootballTeamsScreen({Key? key}) : super(key: key);

  @override
  _JoinFootballTeamsScreenState createState() =>
      _JoinFootballTeamsScreenState();
}

class _JoinFootballTeamsScreenState extends State<JoinFootballTeamsScreen> {
  late SharedPreferences prefs;
  late String id = "";
  late List<Team> teams = [];
  late Future<bool> fetchedTeams;

  Future<bool> fetchTeam() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    var test = await TeamService().getTeams(id);
    print("Ena teams" + teams.toString());

    test?.forEach((element) {
      teams.add(element);
    });

    setState(() {});
    return true;
  }

  @override
  void initState() {
    fetchedTeams = fetchTeam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          "Join a team",
          style: TextStyle(fontSize: appBarTitleSize),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchedTeams,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(128, 128, 128, 0.2)),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromRGBO(128, 128, 128, 0.3)),
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0, top: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.green, width: 2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              teams[index].picture!))),
                                ),
                                SizedBox(
                                  width: 5,
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
                                    Text(
                                      teams[index].players.length.toString() +
                                          "/15",
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
                                  children: [
                                    Text(
                                      "Team's Slogan !",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      teams[index].name!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Approved by Sportpall  ",
                                      style: TextStyle(
                                          color: Colors.indigoAccent,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: InkWell(
                                    onTap: () async {
                                      var sendRequest =
                                          await NotificationService()
                                              .joinRequest(id,
                                                  teams[index].captain!.id!);
                                      print("ena id " + sendRequest.toString());
                                      print("ena id " +
                                          teams[index].captain!.id!.toString());
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color(0xff157519), Color(0xff5bb85f)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        "Send Request",
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
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
