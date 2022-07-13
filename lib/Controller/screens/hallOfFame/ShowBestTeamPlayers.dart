import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sportpal/Model/User.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';

import '../Tennis/CardProvider.dart';

class ShowBestTeamPlayers extends StatefulWidget {
  const ShowBestTeamPlayers({Key? key}) : super(key: key);

  @override
  _ShowBestTeamPlayersState createState() => _ShowBestTeamPlayersState();
}

class _ShowBestTeamPlayersState extends State<ShowBestTeamPlayers> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Best players ",
          style: TextStyle(fontSize: appBarTitleSize),
        ),
        centerTitle: true,
        backgroundColor: themeColor,
      ),
      body: ListWheelScrollView.useDelegate(
        itemExtent: 340,
        childDelegate: ListWheelChildBuilderDelegate(

            childCount: 4, builder: (context, index) {
          final provider = Provider.of<CardProvider>(context);
          final tinderUsers = provider.users;
              return buildMiniTennisCardPro(tinderUsers[index],index);
        }),
      ),
    );
  }



  Widget buildMiniTennisCardPro(User player, int index) {
    return Stack(
      children: [
        Container(
          width: 330,
          height: 460,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: themeColor, width: 1.8),
              image: DecorationImage(
                  image: AssetImage("assets/images/miniTennisPro.png"),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: 85,
          left: 128,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                    image: NetworkImage(player.profilePic!),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
            left: 63,
            top: 90,
            child: Text(
              index.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            )),
        Positioned(
            left: 107,
            top: 258,
            child: SizedBox(
              width: 130,

              child: Text(
                "Gouider seifeddine",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold),

              ),
            )),
      ],
    );
  }

}

