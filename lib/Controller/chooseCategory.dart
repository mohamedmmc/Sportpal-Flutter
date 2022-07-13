import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/home/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Service/PlayerService.dart';
import 'package:sportpal/constants.dart';

import '../variables.dart';

class ChooseCategory extends StatefulWidget {
  const ChooseCategory({Key? key}) : super(key: key);

  @override
  _ChooseCategoryState createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Pick a sport",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      themeColor = footballColorPrimary;
                      selectedSport = "foot";
                      prefs.setString("type", "Football");
                      prefs.setString("typeSport", "62539ec1985d0a160d180840");
                      var getPlayerList =
                          await PlayerService().getAllPlayers(id);

                      print(getPlayerList?.toList(growable: true));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage2()));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.center,
                              image: AssetImage("assets/images/foot.jpg"),
                              fit: BoxFit.cover)),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                              Colors.black.withOpacity(.3),
                              Colors.black.withOpacity(.7)
                            ])),
                        //    decoration: BoxDecoration(
                        //    gradient: LinearGradient(begin: Alignment.bottomRight,colors: [
                        //    Colors.black.withOpacity(.5),
                        //  Colors.black.withOpacity(.6)
                        //])
                        //),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Football",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: InkWell(
                  onTap: () async {
                    themeColor = tennisColorPrimary;
                    selectedSport = "tennis";
                    prefs.setString("type", "Tennis");
                    prefs.setString("typeSport", "62539ed4985d0a160d180844");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage2()));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/tennis.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.7)
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Tennis",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        showSimpleDialog(context,"Basketball");
                      },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/basketball.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.7)
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Basketball",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                      onTap: (){
                        showSimpleDialog(context,"Ping Pong");
                      },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/pp.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.7)
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Ping Pong",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    showSimpleDialog(context,"Esports");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/esports.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.7)
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Esports",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
              ],
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

  void showSimpleDialog(BuildContext context , String txt) => showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
          title: Text(
            txt + " not available yet",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          children: [
            SizedBox(height: 15,),
            SimpleDialogOption(
              onPressed: () async {
                themeColor = footballColorPrimary;
                selectedSport = "foot";
                prefs.setString("type", "Football");
                prefs.setString("typeSport", "62539ec1985d0a160d180840");
                var getPlayerList =
                    await PlayerService().getAllPlayers(id);

                print(getPlayerList?.toList(growable: true));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage2()));
              },
              child: Row(
                children: [
                  Icon(Icons.sports_soccer , color: footballColorPrimary,),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text("Click to choose Football",style: TextStyle(
                          color: footballColorPrimary,fontSize: 18,fontWeight: FontWeight.w700
                      ),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            SimpleDialogOption(
              onPressed: () async {
                themeColor = tennisColorPrimary;
                selectedSport = "tennis";
                prefs.setString("type", "Tennis");
                prefs.setString("typeSport", "62539ed4985d0a160d180844");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage2()));
              },
              child: Row(
                children: [
                  Icon(Icons.sports_tennis , color: tennisColorPrimary,),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text("Click to choose Tennis",style: TextStyle(
                          color: tennisColorPrimary,fontSize: 18,fontWeight: FontWeight.w700
                      ),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
