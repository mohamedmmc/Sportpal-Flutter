import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/ProCard/fillProTennisCardForm.dart';
import 'package:sportpal/constants.dart';

import '../../../variables.dart';
import 'package:shared_preferences/shared_preferences.dart';



class GenerateProCardTennis extends StatefulWidget {
  const GenerateProCardTennis({Key? key, required this.serve,required this.forehand,required this.backhand,required this.slice,required this.volley,required this.dropshot}) : super(key: key);

  final String serve;
  final String forehand;
  final String backhand;
  final String slice;
  final String volley;
  final String dropshot;



  @override
  _GenerateProCardTennisState createState() => _GenerateProCardTennisState();
}

class _GenerateProCardTennisState extends State<GenerateProCardTennis> {
  late Future<bool> fetchedUser;
  late String fullname;
  late String profilPic;
  late Set<String> a;
  late SharedPreferences prefs;


  late double score;


  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    a = prefs.getKeys();
    fullname = prefs.getString("fullName")!;
    profilPic = prefs.getString("profilePic")!;
    print(a);
    return true;
  }

  @override
  void initState() {

    var p = int.parse(widget.serve);
    var d = int.parse(widget.forehand);
    var s = int.parse(widget.volley);
    var m = int.parse(widget.dropshot);
    var n = int.parse(widget.backhand);
    var x = int.parse(widget.slice);


    score = (p+d+s+m+n+x) / 6 ;

    fetchedUser = fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          "Professional Card",
          style: TextStyle(
            fontSize: appBarTitleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && profilPic != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(
                          "Here is your \nprofessional card",

                          style: TextStyle(
                              color: tennisColorPrimary,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 330,
                          height: 460,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              border: Border.all(color: themeColor, width: 1.8),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/tennisPro.png"),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          top: 85,
                          left: 132,
                          child: Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                image: DecorationImage(
                                    image: NetworkImage(profilPic), fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                            top: 240,
                            left: 120,
                            child: SizedBox(
                              width: 130,

                              child: Text(
                                fullname,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(fontSize: 24, color: Colors.white),

                              ),
                            )),

                        //kbira boukol

                        Positioned(
                            left: 72,
                            top: 90,
                            child: Text(
                              score.toInt().toString(),style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700
                            ),
                            )
                        ),


                        Positioned(
                          left: 70,
                            top: 349,
                            child: Text(
                              widget.forehand,style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                            ),
                            )
                        ),
                        Positioned(
                            left: 70,
                            top: 318,
                            child: Text(
                              widget.backhand,style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),
                            )
                        ),
                        Positioned(
                            left: 70,
                            top: 289,
                            child: Text(
                              widget.serve,style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),
                            )
                        ),
                        Positioned(
                            left: 186,
                            top: 318,
                            child: Text(
                              widget.volley,style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),
                            )
                        ),
                        Positioned(
                            left: 186,
                            top: 289,
                            child: Text(
                              widget.slice,style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),
                            )
                        ),
                        Positioned(
                            left: 186,
                            top: 349,
                            child: Text(
                              widget.dropshot,style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700
                            ),
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () {
                      //TODO GENERATE QR CODE
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffff6e40), Color(0xffeeaa44)] ,
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )
                        ,
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Generate QR code",
                          style: TextStyle(color: Colors.white,fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
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
}
