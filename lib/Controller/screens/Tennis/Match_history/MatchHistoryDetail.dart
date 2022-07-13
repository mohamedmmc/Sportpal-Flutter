import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Model/Player.dart';
import '../../../../Model/Matche.dart';
import '../../../../Model/Team.dart';
import '../../../../Service/FavoriteService.dart';
import '../../../../constants.dart';
import '../../../../variables.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MatchHistoryDetailTennis extends StatefulWidget {
  const MatchHistoryDetailTennis({Key? key, required this.match, required this.adversaire}) : super(key: key);
  final Matche match ;
  final Player adversaire ;

  @override
  _MatchHistoryDetailTennisState createState() => _MatchHistoryDetailTennisState();
}

class _MatchHistoryDetailTennisState extends State<MatchHistoryDetailTennis> {


  String data = "Victory";

  late Future<bool> fetchedUser;
  late SharedPreferences prefs;
  late String id;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    //print("votre adversaire est : "+widget.adversaire.fullName!);
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
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text(
          "Match History",
          style: TextStyle(fontSize: appBarTitleSize),
        ),
      ),
      body: FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    "Against "+ widget.adversaire.fullName!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        fontFamily: 'Cardo'
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    left: 30,
                    right: 30,
                    bottom: 25,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            color: Colors.black12,
                            offset: Offset(0, 6),
                          ),
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Victory",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: changeColor(),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("VS",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: changeColor(), width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  image: DecorationImage(
                                      image:
                                      NetworkImage(widget.match.teamB!.players[0]!.profilePic!)),
                                ),
                              ),
                              Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "-",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: changeColor(), width: 2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  image: DecorationImage(
                                      image:
                                      NetworkImage(widget.match.teamA!.players[0]!.profilePic!)
                                  ),
                                ),
                              )],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.sports_tennis,),
                              Padding(
                                padding: const EdgeInsets.only(left:75.0),
                                child: Text("7",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                child: Text("5",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Icon(Icons.sports_tennis,),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.sports_tennis,),
                              Padding(
                                padding: const EdgeInsets.only(left:75.0),
                                child: Text("4",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                child: Text("6",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Icon(Icons.sports_tennis,),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.sports_tennis,),
                              Padding(
                                padding: const EdgeInsets.only(left:75.0),
                                child: Text("6",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                child: Text("3",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Icon(Icons.sports_tennis,),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.sports_tennis,),
                              Padding(
                                padding: const EdgeInsets.only(left:75.0),
                                child: Text("2",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                child: Text("6",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Icon(Icons.sports_tennis,),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            children: [
                              SizedBox(width: 8,),
                              Icon(Icons.sports_tennis,),
                              Padding(
                                padding: const EdgeInsets.only(left:75.0),
                                child: Text("6",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 1.0),
                                child: Text("4",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Icon(Icons.sports_tennis,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: RaisedButton(
                                    color: Color(0xffefb814),
                                    child: new Text(
                                      'Add to favorites',
                                      style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () async{
                                      print(widget.match.id!);
                                      var fav = await FavoriteService().addFavorites(widget.match.id!, "", id,widget.adversaire.id!);

                                      if(fav == "added to fav"){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AlertDialog(
                                              title: Text("Information"),
                                              content: Text("Added to favorites !"),
                                            );
                                          },
                                        );
                                      }else if (fav == "duplicate"){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AlertDialog(
                                              title: Text("Information"),
                                              content: Text("Already in your favorite tab!"),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0))),
                              ),
                              SizedBox(width: 20,),
                              Container(
                                child: RaisedButton(
                                    color: themeColor,
                                    child: new Text(
                                      'Done',
                                      style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
  changeColor() {
    if(data == "Victory"){
      return Colors.green[700];
    }else if (data == "Tie"){
      return Colors.grey;
    }else {
      return Colors.red;
    }
  }
}
