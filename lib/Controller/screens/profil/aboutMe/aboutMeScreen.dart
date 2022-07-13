import 'package:flutter/material.dart';
import 'package:sportpal/Service/PlayerService.dart';

import '../../../../Model/Player.dart';
import '../../../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key, required this.fullName, required this.profilePic,  this.birthDate, required this.friends, this.strongLeg, this.strongHand, this.favCourt, this.knowledge, this.idol, this.role, this.position, this.idPlayer}) : super(key: key);

  final String fullName;
  final String? idPlayer;
  final String profilePic;
  final String? birthDate;
  final String? friends;
  final String? strongLeg;
  final String? strongHand;
  final String? favCourt;
  final String? knowledge;
  final String? idol;
  final String? role;
  final String? position;


  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();

}

class _AboutMeScreenState extends State<AboutMeScreen> {


  late Player? showedPlayer;
  late String id;
  late Future<bool> fetchedUser;
  late SharedPreferences prefs;


   Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();

    id = prefs.getString("_id")!;

    if(widget.idPlayer != null){
      var a = PlayerService().detailPlayer(widget.idPlayer!);
      a?.then((result) {
        setState(() => showedPlayer = result);
        print(result?.fullName!);
      });
    }else{
      var a = PlayerService().detailPlayer(id);
      a?.then((result) {
        setState(() => showedPlayer = result);
      });
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    fetchedUser = fetchUser();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData) {
            return Stack(
              children: <Widget>[
                CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 450,
                      backgroundColor: Colors.black,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: true ? NetworkImage(showedPlayer!.profilePic!) : const AssetImage('assets/images/background.png') as ImageProvider,
                                  fit: BoxFit.cover)),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.black,
                                      Colors.black.withOpacity(.3)
                                    ])),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    showedPlayer!.fullName!.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "4 Videos",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                        showedPlayer!.friends!.length.toString() + " friends",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Description",
                                style: TextStyle(color: Colors.grey, height: 1.4,fontSize: 20),
                              ),
                              SizedBox(height: 20,),
                              if(showedPlayer!.sports!.isEmpty)...[
                                Text(
                                  "No data found",
                                  style: TextStyle(color: Colors.grey, height: 1.4),
                                ),
                              ]else...[
                                Column(
                                    children: <Widget>[
                                      for (int i=0; i<showedPlayer!.sports!.length; i++)...[
                                        if(showedPlayer!.sports![i]["strongLeg"]!=null)...[
                                          Text(
                                            "Strong leg : "+showedPlayer!.sports![i]["strongLeg"],
                                            style: TextStyle(color: Colors.grey, height: 1.4),
                                          ),
                                        ],
                                        if(showedPlayer!.sports![i]["idol"]!=null && showedPlayer!.sports![i]["sport"]=="62655b9e900d8f82728d581f")...[
                                          Text(
                                            "Idol Football : "+showedPlayer!.sports![i]["idol"],
                                            style: TextStyle(color: Colors.grey, height: 1.4),
                                          ),
                                        ],
                                        if(showedPlayer!.sports![i]["role"]!=null  && showedPlayer!.sports![i]["sport"]=="62655b9e900d8f82728d581f")...[
                                          Text(
                                            "Favorite role Football : "+showedPlayer!.sports![i]["role"],
                                            style: TextStyle(color: Colors.grey, height: 1.4),
                                          ),
                                        ],
                                        if(showedPlayer!.sports![i]["position"]!=null && showedPlayer!.sports![i]["sport"]=="62655b9e900d8f82728d581f")...[
                                          Text(
                                            "Favorite position Football : "+showedPlayer!.sports![i]["position"],
                                            style: TextStyle(color: Colors.grey, height: 1.4),
                                          ),
                                        ],
                                        if(showedPlayer!.sports![i]["strongHand"]!=null)...[
                                          Text(
                                            "Prefered Hand : "+showedPlayer!.sports![i]["strongHand"],
                                            style: TextStyle(color: Colors.grey, height: 1.4),
                                          ),
                                        ],
                                        if(showedPlayer!.sports![i]["favCourt"]!=null)...[
                                          Text(
                                            "Prefered court : "+showedPlayer!.sports![i]["favCourt"],
                                            style: TextStyle(color: Colors.grey, height: 1.4),
                                          ),
                                        ],
                                        if(showedPlayer!.sports![i]["idol"]!=null  && showedPlayer!.sports![i]["sport"]=="62655baa900d8f82728d5821")...[
                                          Text(
                                            "Idol Tennis : "+showedPlayer!.sports![i]["idol"],
                                            style: TextStyle(color: Colors.grey, height: 1.4),
                                          ),
                                        ],
                                      ],
                                    ]
                                ),


                              ],

                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Born",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              if(showedPlayer!.birthDate !=null)...[
                                Text(
                                  showedPlayer!.birthDate.toString()+ " Tunisia",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ]else...[
                                Text(
                                  "Birthdate not communicated" " Tunisia",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],

                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Nationality",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Tunisian",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Videos",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                              Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    makeVideo(image: 'assets/images/ten1.JPG'),
                                    makeVideo(image: 'assets/images/ten2.JPG'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                "Completed profile : 80% ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),
                              LinearProgressIndicator(
                                value: 0.8,
                                backgroundColor: Colors.grey,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                              )
                            ],
                          ),
                        )
                      ]),
                    )
                  ],
                ),

              ],
            );
          }
          else {
            return const Center(

              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
            DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3)
              ])),
          child: Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}