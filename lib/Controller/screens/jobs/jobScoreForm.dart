import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/constants.dart';

import '../../../variables.dart';


class JobScoreForm extends StatefulWidget {
  const JobScoreForm({Key? key}) : super(key: key);

  @override
  _JobScoreFormState createState() => _JobScoreFormState();
}

class _JobScoreFormState extends State<JobScoreForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: themeColor,
        title: Text(
          "Score",style: TextStyle(
          fontSize: appBarTitleSize
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                            tag: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg/800px-FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg.png",
                            child: Container(
                                height: 130.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg/800px-FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg.png"),
                                        fit: BoxFit.contain)))),
                      ),
                      SizedBox(height: 7.0),
                      Text("description",
                          style: TextStyle(
                              color: Color(0xFFCC8053),
                              fontFamily: 'Cardo',
                              fontSize: 18.0)),
                      Text("team1",
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
                              Text('Wins : 18',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                          )),
                    ])),
                SizedBox(width: 15,),
                Text("VS",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                SizedBox(width: 15,),
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
                            tag: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg/800px-FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg.png",
                            child: Container(
                                height: 130.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg/800px-FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg.png"),
                                        fit: BoxFit.contain)))),
                      ),
                      SizedBox(height: 7.0),
                      Text("description",
                          style: TextStyle(
                              color: Color(0xFFCC8053),
                              fontFamily: 'Cardo',
                              fontSize: 18.0)),
                      Text("team1",
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
                              Text('Wins : 18',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                          )),
                    ])),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 30),
                Text("Score",style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: themeColor
                ),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Team 1 ",style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(width: 50,),
                Text("Team 2 ",style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700
                ),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              offset: Offset(0, 2))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                              )),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(

                                hintText: "0",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text("-",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              offset: Offset(0, 1))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                              )),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "0",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 30),
                Text("Goals",style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: themeColor
                ),),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 20),
                Text("team 1 : ",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: footballColorSecondary
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                          )),
                      child: TextField(
                        maxLines: 5,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "names",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20),
                Text("team 2 : ",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: footballColorSecondary
                ),),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                          )),
                      child: TextField(
                        maxLines: 5,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "names",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.futbol,color: themeColor,),
                InkWell(
                  onTap: (){
                    //TODO validate football match score
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: themeColor),
                    child: Center(
                      child: Text(
                        "Validate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Icon(FontAwesomeIcons.futbol,color: themeColor,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
