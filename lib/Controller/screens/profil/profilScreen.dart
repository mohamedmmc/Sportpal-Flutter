
import 'package:flutter/material.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/variables.dart';

import '../home/MenuWidget.dart';
import 'components/body.dart';
import 'edit.dart';


class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {


  late Future<bool> fetchedUser;
  late String fullname;
  late String id;
  late String email;
  late String telNum;
  late String age;
  late String profilePic;
  late String friends;
  late SharedPreferences prefs;


  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();

    fullname = prefs.getString("fullName")!;
    email = prefs.getString("email")!;
    if((prefs.getString("telNum") ?? "").isNotEmpty){
      telNum = prefs.getString("telNum")!;
    }else{
      telNum = "";
    } if((prefs.getString("birthDate") ?? "").isNotEmpty){
      age = prefs.getString("birthDate")!;
    }else{
      age = "";
    }
    id = prefs.getString("_id")!;
    profilePic = prefs.getString("profilePic")!;
    friends = prefs.getString("friends")!;

    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

      appBar: buildAppBar(),
      body:  FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData) {

            return MyBody(telNum: telNum,age: age,email: email,Fullname: fullname,profilPic:profilePic,friends: friends,);

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

  AppBar buildAppBar() {
    return AppBar(
      leading: MenuWidget(),
      elevation: 0,
      centerTitle: true,
      backgroundColor: themeColor,
      title: Text(
          "Profile"
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(id: id,fullName: fullname,email: email,age: age,profilePic: profilePic,telNum: telNum,)));
            },
            child: Text(
              "Edit",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.defaultSize! * 1.6),
            )
        )
      ],
    );
  }

}


