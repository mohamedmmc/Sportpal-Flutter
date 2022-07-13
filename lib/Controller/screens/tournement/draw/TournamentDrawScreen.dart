import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/tournement/draw/FinalScreen.dart';
import 'package:sportpal/Controller/screens/tournement/draw/QuarterFinalScreen.dart';
import 'package:sportpal/Controller/screens/tournement/draw/Round32FinalScreen.dart';
import 'package:sportpal/Controller/screens/tournement/draw/SemiFinalScreen.dart';
import 'package:sportpal/Controller/screens/tournement/model/tournement.dart';

import '../../../../Model/Tournament.dart';
import '../../../../constants.dart';
import '../../../../variables.dart';
import 'Round16FinalScreen.dart';
import 'Round8FinalScreen.dart';

class TournamentDrawScreen extends StatefulWidget {
  final Tournament tournement;

  const TournamentDrawScreen({Key? key, required this.tournement})
      : super(key: key);

  @override
  _TournamentDrawScreenState createState() => _TournamentDrawScreenState();
}

class _TournamentDrawScreenState extends State<TournamentDrawScreen> {
  final screens = [
    Tab(
      icon: Icon(FontAwesomeIcons.trophy),
      text: "1/32-finals",
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.trophy),
      text: "1/16-finals",
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.trophy),
      text: "1/8-finals",
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.trophy),
      text: "Quarter-finals",
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.trophy),
      text: "Semi-Finals",
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.trophy),
      text: "Final",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              screens[0],
              screens[1],
              screens[2],
              screens[3],
              screens[4],
              screens[5],
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [themeColor, Colors.black])
            ),
          ),
          title: Text(
            widget.tournement.title! + " draw ",
            style: TextStyle(fontSize: appBarTitleSize),
          ),
          centerTitle: true,
          backgroundColor: themeColor,
        ),
        body: TabBarView(
          children: [
            Round32FinalScreen(),
            Round16FinalScreen(),
            Round8FinalScreen(),
            QuarterFinalScreen(),
            SemiFinalScreen(),
            FinalScreen(),
          ],
        ),
      ),
    );
  }
}
