import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/ProCard/GenerateProCardFootball.dart';
import 'package:sportpal/Controller/screens/ProCard/GenerateProCardTennis.dart';
import 'package:sportpal/Controller/screens/ProCard/fillProFootballCardForm.dart';
import 'package:sportpal/Controller/screens/ProCard/fillProTennisCardForm.dart';
import 'package:sportpal/Controller/screens/missions/MissionsMainScreen.dart';
import 'package:sportpal/Controller/screens/missions/football/footballMissionsList.dart';
import 'package:sportpal/Controller/screens/missions/tennis/tennisMissionsList.dart';
import 'package:sportpal/Controller/screens/profil/aboutMe/aboutMeScreen.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/size_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/variables.dart';

class MyBody extends StatefulWidget {
  const MyBody(
      {Key? key,
      required this.Fullname,
      required this.email,
      required this.telNum,
      this.age,
      required this.profilPic,
      this.friends})
      : super(key: key);
  final String Fullname;
  final String email;
  final String? friends;
  final String telNum;
  final String? age;
  final String profilPic;

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  DateTime ageNow = DateTime.now();

  @override
  void initState() {
    ageNow = DateTime.now();
    if ((widget.age ?? "").isNotEmpty) {
      ageNow = DateTime.parse(widget.age!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: defaultSize! * 24,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CustomShape(),
                    child:
                        Container(height: defaultSize * 15, color: themeColor),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: defaultSize * 14,
                          width: defaultSize * 14,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white,
                                  width: defaultSize * 0.8),
                              image: DecorationImage(
                                  image: widget.profilPic.isEmpty
                                      ? AssetImage('assets/images/athlete.png')
                                      : true
                                          ? NetworkImage(widget.profilPic)
                                          : const AssetImage(
                                                  'assets/images/background.png')
                                              as ImageProvider,
                                  //true ? NetworkImage(widget.profilPic) : AssetImage('assets/images/background.png') as ImageProvider,
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          widget.Fullname,
                          style: TextStyle(
                              fontSize: defaultSize * 2.2, color: kTextColor),
                        ),
                        SizedBox(height: defaultSize / 2),
                        Text(
                          "Age : " +
                              (DateTime.now().year - ageNow.year).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8492A2),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AboutMeScreen(
                              birthDate: widget.age,
                              fullName: widget.Fullname,
                              profilePic: widget.profilPic,
                              friends: widget.friends,
                              idol: "",
                              knowledge: "",
                              position: "",
                              role: "",
                              strongHand: "",
                              strongLeg: "",
                              favCourt: "",
                            )));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSize * 2, vertical: defaultSize * 3),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: defaultSize * 2,
                    ),
                    Text(
                      "About me",
                      style: TextStyle(
                          fontSize: defaultSize * 1.8, color: kTextLigntColor),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: defaultSize * 1.6,
                      color: kTextLigntColor,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MissionsMainScreen()));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSize * 2, vertical: defaultSize * 3),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.tasks),
                    SizedBox(
                      width: defaultSize * 2,
                    ),
                    Text(
                      "Missions",
                      style: TextStyle(
                          fontSize: defaultSize * 1.8, color: kTextLigntColor),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: defaultSize * 1.6,
                      color: kTextLigntColor,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showAlertDialog2(context, "Trophies");
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSize * 2, vertical: defaultSize * 3),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.trophy),
                    SizedBox(
                      width: defaultSize * 2,
                    ),
                    Text(
                      "Trophies",
                      style: TextStyle(
                          fontSize: defaultSize * 1.8, color: kTextLigntColor),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: defaultSize * 1.6,
                      color: kTextLigntColor,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultSize * 2, vertical: defaultSize * 3),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.star),
                    SizedBox(
                      width: defaultSize * 2,
                    ),
                    Text(
                      "get your professional card",
                      style: TextStyle(
                          fontSize: defaultSize * 1.8, color: kTextLigntColor),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: defaultSize * 1.6,
                      color: kTextLigntColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog2(BuildContext context, String txt) => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text('Not yet available'),
            content: Text(txt +
                ' are not done yet.\nWe will inform you with a mail once it is done'),
            actions: [
              FlatButton(
                textColor: Color(0xFF6200EE),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(child: Text('Okay')),
              ),
            ],
          ));

  void showAlertDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Row(
              children: [
                Text('Almost done'),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.sports_tennis,
                  color: tennisColorPrimary,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.sports_soccer,
                  color: footballColorPrimary,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.sports_handball,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.sports_esports,
                  color: Colors.blue.shade900,
                ),
              ],
            ),
            content: Text(
                'This feature is currently in dev mode and is not complete yet, you want to check it out ?'),
            actions: [
              FlatButton(
                textColor: Color(0xFF6200EE),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('CANCEL'),
              ),
              FlatButton(
                textColor: Color(0xFF6200EE),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => selectedSport == "tennis" ? fillProTennisCardForm() : fillProFootballCardForm()));
                },
                child: Text('ACCEPT'),
              ),
            ],
          ));
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
