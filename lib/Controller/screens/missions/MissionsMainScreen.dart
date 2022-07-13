import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/missions/football/FootballPoints.dart';
import 'package:sportpal/Controller/screens/missions/football/footballMissionsList.dart';
import 'package:sportpal/Controller/screens/missions/tennis/TennisPoints.dart';
import 'package:sportpal/Controller/screens/missions/tennis/tennisMissionsList.dart';
import 'package:sportpal/constants.dart';

import '../../../variables.dart';


class MissionsMainScreen extends StatefulWidget {
  const MissionsMainScreen({Key? key}) : super(key: key);

  @override
  _MissionsMainScreenState createState() => _MissionsMainScreenState();
}

class _MissionsMainScreenState extends State<MissionsMainScreen> {

  final screens = [
    Tab(icon: Icon(Icons.add_task), text: "My Points",),
    Tab(icon: Icon(Icons.list_alt_rounded), text: "My Missions",),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              screens[0],
              screens[1],
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [themeColor, Color(0xff3e5e6f)])
            ),
          ),
          title: Text(
            "Missions",style: TextStyle(fontSize: appBarTitleSize),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            selectedSport == "tennis" ? TennisPointsScreen() : FootballPointsScreen(),
            selectedSport == "tennis" ? tennisMissionList() : footballMissionList(),
          ],
        ),
      ),
    );
  }
}
