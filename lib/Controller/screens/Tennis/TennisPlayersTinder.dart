import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sendbird_sdk/core/channel/group/group_channel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/variables.dart';
import '../../../constants.dart';
import '../Bookmark/bookmarkScreen.dart';
import '../Match/MatchScreen.dart';
import '../sendbird/ChannelListView.dart';
import '../sendbird/group_channel_view.dart';
import 'CardProvider.dart';
import 'TennisFilter.dart';
import 'TinderCard.dart';

class TennisPlayerTinderScreen extends StatefulWidget {
  const TennisPlayerTinderScreen({Key? key}) : super(key: key);

  @override
  _TennisPlayerTinderScreenState createState() =>
      _TennisPlayerTinderScreenState();
}

class _TennisPlayerTinderScreenState extends State<TennisPlayerTinderScreen> {
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
    fetchedUser =  fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [themeColor, Colors.black])),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(selectedSport == "tennis" ? Icons.sports_tennis: Icons.sports_soccer),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookmarkScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person_search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TennisFilter()));
              },
            ) ,
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                buildLogo(),
                SizedBox(height: 16),

                FutureBuilder(
                  future: fetchedUser,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if(snapshot.hasData) {

                      return Expanded(child: buildCards());


                    }
                    else {
                      return const Center(

                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildFrontCard() => GestureDetector();

  buildLogo() => Row(
        children: [
          Icon(
            Icons.sports_cricket,
            color: Colors.white,
            size: 36,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "SportPal",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: 'Productsans',
                color: Colors.white),
          )
        ],
      );

  buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {

                final provider = Provider.of<CardProvider>(context,listen: false);
                provider.dislike();
              },
              child: Icon(
                Icons.clear,
                color: Colors.red,
                size: 20,
              )),
          ElevatedButton(
              onPressed: () {
                final provider = Provider.of<CardProvider>(context,listen: false);
                provider.superlike();

              },
              child: Icon(
                Icons.star,
                color: Colors.blue,
                size: 20,
              )),
          ElevatedButton(
            //eli bech tabaath
            style: ButtonStyle(),
              onPressed: () {
                final provider = Provider.of<CardProvider>(context,listen: false);
                  provider.like();
              },
              child: Icon(
                FontAwesomeIcons.heart,
                color: Colors.teal,
                size: 20,
              )),
        ],
      );

  buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final tinderUsers = provider.users;
    return tinderUsers.isEmpty ? Center(
      child: ElevatedButton(
        child: Text("restart",style: TextStyle(color:Colors.black,fontSize: 30)),
        onPressed: (){
          final provider = Provider.of<CardProvider>(context,listen: false);
          provider.resetUsers();
        },
      ),
    ):Stack(
        children: tinderUsers
            .map((user) => TinderCard(
            user: user,
            isFront: tinderUsers.last == user))
            .toList());
  }

}
