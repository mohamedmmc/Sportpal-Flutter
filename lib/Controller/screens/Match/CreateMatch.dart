import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/Match/widgets/userCard.dart';
import 'package:sportpal/Model/Complexe.dart';
import 'package:sportpal/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/variables.dart';

import '../../../Model/Player.dart';


class CreateMatchScreen extends StatefulWidget {
  const CreateMatchScreen({Key? key, required this.user}) : super(key: key);
  final Player user;
  @override
  _CreateMatchScreenState createState() => _CreateMatchScreenState();
}

class _CreateMatchScreenState extends State<CreateMatchScreen> {
  late String profilPic;
  late String fullName;
  late String id;
  late String age;
  late SharedPreferences prefs;
  DateTime ageNow = DateTime.now();
  final List<Complexe> listComplexe = [];
  late Future<bool> fetchedComplexe;

  Future<bool> fetchComplexe() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      profilPic = prefs.getString("profilePic")!;
      prefs.remove("stadium");
      id = prefs.getString("_id")!;
      fullName = prefs.getString("fullName")!;

      if(prefs.getString("birthDate") != null){
        age = prefs.getString("birthDate")!;
      }else{
        age = "0";
      }
    });
    return true;
  }

  @override
  void initState() {
    fetchedComplexe = fetchComplexe();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Match",
          style: TextStyle(
              fontSize: appBarTitleSize
          ),
        ),
        centerTitle: true,
        backgroundColor: themeColor,
      ),
      body: FutureBuilder(
          future: fetchedComplexe ,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if(snapshot.hasData) {
              return Center(child: UserCardWidget(user: widget.user ,profilePic: profilPic,fullName: fullName,id: id,));
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}