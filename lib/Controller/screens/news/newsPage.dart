import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/Tennis/Match_history/MatchHistoryList.dart';
import 'package:sportpal/Controller/screens/news/pages/PopularNewsScreen.dart';
import 'package:sportpal/Controller/screens/news/pages/RecentNewsScreen.dart';
import 'package:sportpal/Controller/screens/news/pages/TrendingNewsScreen.dart';
import 'package:sportpal/Controller/screens/team/checkIfHasTeamScreen.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';
import '../Foot/JoinFootballTeamsScreen.dart';
import '../Tennis/TennisPlayersTinder.dart';
import '../hallOfFame/hallOfFameFootball.dart';
import '../hallOfFame/hallOfFameTennis.dart';
import '../home/MenuWidget.dart';
import '../profil/profilScreen.dart';
import '../team/TeamScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../team/createTeamScreen.dart';
import '../tournement/TournementsListScreen.dart';
import '../tournement/createTournement.dart';

class NewsPageScreen extends StatefulWidget {
  const NewsPageScreen({Key? key}) : super(key: key);

  @override
  _NewsPageScreenState createState() => _NewsPageScreenState();
}

class _NewsPageScreenState extends State<NewsPageScreen> {
  late Future<bool> fetchedUser;
  late String fullname;
  late String profilPic;
  late SharedPreferences prefs;

  late String idTeam;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    fullname = prefs.getString("fullName")!;
    setState(() {
      haveTeam = false;
    });
    profilPic = prefs.getString("profilePic")!;
    if (prefs.getString("team0") != null) {
      print(prefs.getString("team0")!.length);
      idTeam = prefs.getString("team0")!;
      setState(() {
        haveTeam = true;
      });
    }
    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();

    super.initState();
  }

  final screens = [
    TabBarView(
      children: [PopularTabView(), TrendingNewsScreen(), RecentNewsScreen()],
    ),
    ProfilScreen(),
    selectedSport == "tennis"
        ? TennisPlayerTinderScreen()
        : haveTeam
            ? FootBallTeam()
            : CustomDialog(
                title: "No team yet",
                description:
                    "You do not have a team yet !\n you can either create a team or join a team",
              ),
    selectedSport == "tennis" ? HallOfFameTennis() : HallOfFameFootball(),
    TournementScreenList()
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        FontAwesomeIcons.user,
        size: 28,
      ),
      selectedSport == "tennis"
          ? Icon(
              Icons.sports_tennis,
              size: 30,
            )
          : Icon(
              Icons.sports_soccer,
              size: 30,
            ),
      Icon(
        Icons.star_half_rounded,
        size: 30,
      ),
      Icon(
        FontAwesomeIcons.trophy,
        size: 30,
      ),
    ];
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              animationDuration: Duration(milliseconds: 400),
              color: themeColor,
              items: items,
              height: 60,
              index: index,
              onTap: (index) {
                setState(() {
                  this.index = index;
                });
              },
            ),
            appBar: index == 0
                ? PreferredSize(
                    preferredSize: Size.fromHeight(120.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        FutureBuilder(
                          future: fetchedUser,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            if (snapshot.hasData) {
                              return InkWell(
                                onTap: () {
                                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
                                },
                                child: ListTile(
                                  leading: MenuWidget(),
                                  title: Text(
                                    "Welcome",
                                    style: kNonActiveTabStyle,
                                    textAlign: TextAlign.end,
                                  ),
                                  subtitle: Text(
                                    fullname,
                                    textAlign: TextAlign.end,
                                    style: kActiveTabStyle,
                                  ),
                                  trailing: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: true
                                              ? NetworkImage(profilPic)
                                              : AssetImage(
                                                      'assets/images/footnews1.png')
                                                  as ImageProvider,
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: kGrey1,
                            unselectedLabelStyle: kNonActiveTabStyle,
                            indicatorSize: TabBarIndicatorSize.label,
                            isScrollable: true,
                            indicatorColor: Colors.white,
                            labelStyle: kActiveTabStyle.copyWith(fontSize: 22),
                            tabs: [
                              Tab(
                                text: "Popular",
                              ),
                              Tab(
                                text: "Trending",
                              ),
                              Tab(
                                text: "Recent",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : null,
            body: screens[index]));
  }
}

class CustomDialog extends StatelessWidget {
  final String? title, description, buttonText;
  final Image? image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: DialogContent(context),
    );
  }

  DialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                description!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JoinFootballTeamsScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff126415), Color(0xff5bb85f)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Join",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateTeamScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff126415), Color(0xff5bb85f)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Create",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
              child: Image(image: AssetImage("assets/images/logoApp.png"),),
              backgroundColor: Colors.blueAccent,
              radius: 50,
            ))
      ],
    );
  }
}
