import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sportpal/Controller/screens/home/Home.dart';
import 'package:sportpal/Controller/screens/profil/Settings/SettingsPage.dart';
import 'package:sportpal/Service/PlayerService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/variables.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(
      {Key? key,
      required this.email,
      required this.telNum,
      required this.age,
      required this.profilePic,
      required this.fullName,
      required this.id})
      : super(key: key);
  final String email;
  final String id;
  final String telNum;
  final String fullName;
  final String age;
  final String profilePic;

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  DateTime birthDate = DateTime.now();

  late SharedPreferences prefs;
  late Future<bool> fetchedUser;
  late String fullName;
  late String id;
  late String email;
  late String telNum;
  late String age;
  late String profilePic;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();

    fullName = prefs.getString("fullName")!;
    email = prefs.getString("email")!;
    if (prefs.getString("telNum") != null) {
      telNum = prefs.getString("telNum")!;
    }
    if (prefs.getString("birthDate") != null) {
      age = prefs.getString("birthDate")!;
    }

    id = prefs.getString("_id")!;

    profilePic = prefs.getString("profilePic")!;

    return true;
  }

  XFile? image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = XFile(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  TextEditingController fullNameTE = new TextEditingController();
  TextEditingController emailTE = new TextEditingController();
  TextEditingController telNumTE = new TextEditingController();
  TextEditingController ageTE = new TextEditingController();
  String? Semail;
  String? StelNum;
  String? SfullName;
  String? Sage;
  late String SprofilePic;

  @override
  void initState() {
    fetchedUser = fetchUser();
    birthDate = DateTime.now();
    if ((widget.age).isNotEmpty) {
      birthDate = DateTime.parse(widget.age);
    }
    super.initState();
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit",
          style: TextStyle(color: themeColor),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: themeColor,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          pickImage(ImageSource.camera);
                        });
                      },
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: widget.profilePic.isEmpty
                                  ? AssetImage('assets/images/athlete.png')
                                  : true
                                      ? NetworkImage(widget.profilePic)
                                      : const AssetImage(
                                              'assets/images/background.png')
                                          as ImageProvider,
                            )),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: themeColor,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(fullNameTE, "Full Name", widget.fullName, false),
              buildTextField(emailTE, "E-mail", widget.email, false),
              buildTextField(telNumTE, "Phone number", widget.telNum, false),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: selectedSport=="tennis" ? [Color(0xffff6e40), Color(0xffeeaa44)] : [Color(0xff126415), Color(0xff5bb85f)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )
                    ,
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(49, 39, 79, 1),
                  ),
                  child: Center(
                    child: Text(
                      "Change your birthday",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pop(context);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (emailTE.text.isNotEmpty) {
                        Semail = emailTE.text;
                      }
                      if (ageTE.text.isNotEmpty) {
                        Sage = ageTE.text;
                      }
                      if (fullNameTE.text.isNotEmpty) {
                        SfullName = fullNameTE.text;
                      }
                      if (telNumTE.text.isNotEmpty) {
                        StelNum = telNumTE.text;
                      }

                      var birthdate =
                          DateFormat("yyyy-MM-dd").format(birthDate);
                      print(birthdate);
                      var update = await PlayerService().updateProfilPlayer(
                          SfullName,
                          Semail,
                          birthdate,
                          StelNum,
                          image?.path,
                          widget.id);
                      if (update == "updated") {
                        setState(() {
                          fetchedUser = fetchUser();
                        });

                        //Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage2()));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              title: Text("Information"),
                              content: Text("Error has occured !"),
                            );
                          },
                        );
                      }
                    },
                    color: themeColor,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText,
      String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 15,
              fontFamily: "Cardo",
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != birthDate) {
      setState(() {
        birthDate = selected;
      });
    }
  }
}
