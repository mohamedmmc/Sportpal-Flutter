import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/Friends/friendRequestScreen.dart';
import 'package:sportpal/Controller/screens/Friends/friendsListScreen.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';

import '../../../variables.dart';



class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {

  final screens =[
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Request",),
    Tab(icon: Icon(FontAwesomeIcons.trophy),text: "Friends",),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: MenuWidget(),
          bottom: TabBar(
            tabs: [
              screens[index],
              screens[index+1],
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
            "Friends",
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
            FriendsRequestScreen(),
            FriendsListScreen(),
          ],
        ),
      ),
    );
  }
}
