import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/variables.dart';


import 'PlayersSavedScreen.dart';
import 'TeamsSavedScreen.dart';
import 'TournementsSavedScreen.dart';


class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {

  final screens =[
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Players",),
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Team",),
    Tab(icon: Icon(FontAwesomeIcons.trophy),text: "Tournements",),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(

          bottom: TabBar(
            tabs: [
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
              "Booksmark",
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.notifications)),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.search)),
          ],


        ),
        body: TabBarView(
          children: [
            TeamsSavedScreen(),
            TournementsSavedScreen(),
          ],
        ),
      ),
    );
  }
}
