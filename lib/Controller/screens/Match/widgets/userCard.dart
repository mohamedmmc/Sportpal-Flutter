import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sportpal/Service/MatchService.dart';
import 'package:sportpal/Service/NotificationService.dart';

import '../../../../Model/Player.dart';
import '../../../../Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../variables.dart';
import '../../Stadiums/ComplexeListScreen.dart';
import '../../profil/aboutMe/aboutMeScreen.dart';
import '../MatchScreen.dart';
import 'buttonHeaderWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserCardWidget extends StatefulWidget {

  @override
  State<UserCardWidget> createState() => _UserCardWidgetState();

  const UserCardWidget({Key? key, required this.fullName, required this.profilePic, required this.id, required this.user});

  final String fullName;
  final String profilePic;
  final String id;
  final Player user;
}

class _UserCardWidgetState extends State<UserCardWidget> {
  DateTime? date;
  TimeOfDay? time;
  late String ageConnected;
  late String? stadium;
  late String? friends;
  late Future<bool> fetchedComplexe;
  late SharedPreferences prefs;
  late String id;
  DateTime ageNowConnected = DateTime.now();
  DateTime ageNowUser = DateTime.now();

  Future<bool> fetchComplexe() async {
    prefs = await SharedPreferences.getInstance();
    print("a");
    if( prefs.getString("birthDate") != null){

      ageConnected = prefs.getString("birthDate")!;
    }
    print(prefs.getKeys());
    friends = prefs.getString("friends")!;
    print("a");
    id = prefs.getString("_id")!;
    print("b");
    ageNowConnected = DateTime.now();
    print("c");

    print("e");
    if (widget.user.birthDate !=null) {
      ageNowUser = DateTime.parse(widget.user.birthDate!);
      print("f");
    }
    print("g");

    return true;
  }

  @override
  void initState() {
    fetchedComplexe = fetchComplexe();
    super.initState();
  }


  String getTextTime(){
    if(time == null){
      return "Select Time";
    }
    else {
      final hours = time!.hour.toString().padLeft(2,"0");
      final minutes = time!.minute.toString().padLeft(2,"0");
      return "$hours:$minutes";
    }
  }

  String getText(){
    if (date==null){
      return "Select Date";
    } else {
      return DateFormat("yyyy-MM-dd").format(date!);
      //return "${date!.month}/${date!.day}/${date!.year}";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: fetchedComplexe ,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if(snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 5,right: 15.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: _buildCard(
                                    widget.user.fullName!,
                                    (DateTime.now().year - ageNowUser.year).toString()+" years",

                                    widget.user.profilePic!,
                                    widget.user.friends!.length.toString(),
                                  )),
                              SizedBox(
                                width: 50,
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      "VS",style: TextStyle(
                                        fontSize: 30
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: _buildCard(

                                  widget.fullName,
                                  (DateTime.now().year - ageNowConnected.year).toString()+ " years"
                                      .toString(),
                                  widget.profilePic,
                                  widget.user.friends!.length.toString(),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 20,),
                      ButtonHeaderWidget(
                          title: 'Date',
                          text: getText(),
                          onClicked:() => pickDate(context)
                      ),
                      SizedBox(height: 20,),
                      ButtonHeaderWidget(
                          title: 'Time',
                          text: getTextTime(),
                          onClicked:() => pickTime(context)
                      ),
                      SizedBox(height: 20,),
                      ButtonHeaderWidget(
                          title: 'Stadium',
                          text: "Click here to select your stadium",
                          onClicked:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ComplexeListScreen()));
                          }
                      ),
                      ElevatedButton(onPressed: ()async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if(prefs.getString("stadium")==null){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("Pick a stadium"),
                              );
                            },
                          );
                        }else if (date == null){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text("Information"),
                                content: Text("Pick a date"),
                              );
                            },
                          );
                        }else{
                          //var createMatch = await MatchService().createIndivMatch(widget.id, "62489877713a64d41460b13c", date!, prefs.getString("stadium")!);
                          print("stade selectionne : "+Stadium);
                          var requestMatch = await NotificationService().matchRequest(id, widget.user.id!);

                          Navigator.pop(context);
                        }

                      }, child: Text(
                          "Create Match"
                      ))

                    ],
                  );
                }
                else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
          )
      ),
    );
  }

  Widget _buildCard(String name, String description, String imgPath,String friends) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMeScreen(fullName:name ,profilePic:imgPath ,birthDate: description,friends: friends,)));
            },
            child: Container(
                height: 250,
                width: 120,
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
                        tag: imgPath,
                        child: Container(
                            height: 130.0,
                            width: 130.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(imgPath),
                                    fit: BoxFit.contain)))),
                  ),
                  SizedBox(height: 7.0),
                  Text(description,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Cardo',
                          fontSize: 18.0)),
                  Text(name,
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
                ]))));
  }

  Future pickDate(BuildContext context) async{
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().day,DateTime.now().month,DateTime.now().day),
        lastDate: DateTime(DateTime.now().year + 3));

    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }

  Future pickTime(BuildContext context) async{
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime:time ?? initialTime
    );
    if (newTime == null) return;
    setState(()=>time = newTime);

  }
}