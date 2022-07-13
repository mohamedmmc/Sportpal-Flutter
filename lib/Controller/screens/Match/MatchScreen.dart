import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/variables.dart';

import 'AcceptedMatchsScreen.dart';
import 'MatchRequestsScreen.dart';
import 'PendingMatchsScreen.dart';



class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {

  final screens =[
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Requests",),
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Accepted",),
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Upcoming",),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              screens[0],
              screens[index+1],
              screens[index+2],
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [themeColor, Colors.black26])
            ),
          ),
          title: Text(
            "Matchs",
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            MatchRequestScreen(),
            AcceptedMAtchsScreen(),
            PendingMatchsScreen(),
          ],
        ),
      ),
    );
  }
}
