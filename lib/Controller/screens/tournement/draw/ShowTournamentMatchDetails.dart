import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';


class ShowTournamentMatchDetails extends StatefulWidget {
  const ShowTournamentMatchDetails({Key? key}) : super(key: key);

  @override
  _ShowTournamentMatchDetailsState createState() => _ShowTournamentMatchDetailsState();
}

class _ShowTournamentMatchDetailsState extends State<ShowTournamentMatchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
            "Final",
          style: TextStyle(
            fontSize: appBarTitleSize
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 250,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Hero(
                          tag: "https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png",
                          child: Container(
                              height: 130.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png"),
                                      fit: BoxFit.contain)))),
                    ),
                    SizedBox(height: 7.0),
                    Text("Liverpool",
                        style: TextStyle(
                            color: Color(0xFFCC8053),
                            fontFamily: 'Cardo',
                            fontSize: 18.0)),
                    Text("From England",
                        style: TextStyle(
                            color: Color(0xFF575E67),
                            fontFamily: 'Cardo',
                            fontSize: 14.0)),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                    Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(FontAwesomeIcons.trophy,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('Wins : 56',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontSize: 18.0))
                          ],
                        )),
                  ])),
              SizedBox(width: 25,),
              Text("VS",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
              SizedBox(width: 25,),
              Container(
                  height: 250,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Hero(
                          tag: "https://upload.wikimedia.org/wikipedia/fr/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png",
                          child: Container(
                              height: 130.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage("https://upload.wikimedia.org/wikipedia/fr/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png"),
                                      fit: BoxFit.contain)))),
                    ),
                    SizedBox(height: 7.0),
                    Text("Real Madrid",
                        style: TextStyle(
                            color: Color(0xFFCC8053),
                            fontFamily: 'Cardo',
                            fontSize: 18.0)),
                    Text("From Spain",
                        style: TextStyle(
                            color: Color(0xFF575E67),
                            fontFamily: 'Cardo',
                            fontSize: 14.0)),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                    Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(FontAwesomeIcons.trophy,
                                color: Color(0xFFD17E50), size: 12.0),
                            Text('Wins : 74',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0xFFD17E50),
                                    fontSize: 18.0))
                          ],
                        )),
                  ])),
            ],
          ),
          SizedBox(height: 25,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                        "Referee : ",
                      style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Mohamed Zitoun",
                      style: TextStyle(
                          fontSize: 24,
                        color: Colors.blue
                      ),
                    ),
                    SizedBox(width: 5,),
                    Icon(Icons.verified,color: Colors.blue,)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  "date : ",
                  style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "30 May 2022",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  "Time : ",
                  style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "5:30 PM",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  "place : ",
                  style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Sami Laaroussi Stadium",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
