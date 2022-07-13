import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sportpal/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/User.dart';
import '../../../constants.dart';
import '../Tennis/CardProvider.dart';
import '../home/MenuWidget.dart';

class HallOfFameTennis extends StatefulWidget {
  const HallOfFameTennis({Key? key}) : super(key: key);

  @override
  _HallOfFameTennisState createState() => _HallOfFameTennisState();
}

class _HallOfFameTennisState extends State<HallOfFameTennis> {
  late Future<bool> fetchedUser;
  late SharedPreferences prefs;
  late String id;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();
  }

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
      body: FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return ListWheelScrollView.useDelegate(
              itemExtent: 340,
              childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 22,
                  builder: (context, index) {
                    final provider =
                        Provider.of<CardProvider>(context, listen: false);
                    final tinderUsers = provider.users;
                    return buildMiniTennisCardPro(tinderUsers[index], index);
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
              (90 - index * 2).toString(),
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
                player.fullName!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
