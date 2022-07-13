import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signIn.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';
import 'package:sportpal/Controller/screens/profil/Settings/ChangePassword.dart';
import 'package:sportpal/Controller/screens/profil/Settings/completeProfilFoot.dart';
import 'package:sportpal/Controller/screens/profil/Settings/completeProfilTennis.dart';
import 'package:sportpal/Controller/screens/profil/edit.dart';
import 'package:sportpal/Controller/screens/profil/profilScreen.dart';
import 'package:sportpal/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Future<bool> fetchedUser;
  late String fullname;
  late String id;
  late String email;
  late String telNum;
  late String age;
  late String profilePic;
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();

    fullname = prefs.getString("fullName")!;
    email = prefs.getString("email")!;
    telNum = prefs.getString("telNum")!;
    id = prefs.getString("_id")!;
    age = prefs.getString("birthDate")!;
    profilePic = prefs.getString("profilePic")!;

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
          backgroundColor: themeColor, elevation: 2, leading: MenuWidget()),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: themeColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
              },
              child: buildAccountOptionRow(
                context,
                "Change password",
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                selectedSport == "tennis" ? Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteProfilTennisPage())):
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteProfilFootPage()));
              },
              child: buildAccountOptionRow(context, "About me settings",Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),),
            ),
            InkWell(
              onTap: (){


              },
              child: buildAccountOptionRow(context, "Social connections",Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),),
            ),
            buildAccountOptionRow(context, "Language select : English",Icon(
              Icons.arrow_drop_down,
              size: 28,
              color: Colors.grey,
            ),),
            buildAccountOptionRow(context, "theme color : day",Icon(
              Icons.arrow_drop_down,
              size: 28,
              color: Colors.grey,
            ),),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: themeColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", false),
            buildNotificationOptionRow("Messages", true),
            buildNotificationOptionRow("friend requests", true),
            buildNotificationOptionRow("Match requests", true),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(20)),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  onPressed: () {
                    prefs.remove("_id");
                    prefs.remove("birthDate");
                    prefs.remove("password");
                    prefs.remove("telNum");
                    prefs.remove("isVerified");
                    prefs.remove("gender");
                    prefs.remove("type");
                    prefs.remove("email");
                    prefs.remove("fullName");
                    prefs.remove("token");
                    prefs.remove("address");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));

                  },
                  child: Text("SIGN OUT",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              activeColor: themeColor,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, Icon icon) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
