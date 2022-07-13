import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportpal/Service/TeamService.dart';
import 'package:sportpal/constants.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../variables.dart';

class FootConstants {
  static const int num1 = 10;
  static const int num2 = 12;
  static const int num3 = 14;
  static const int num4 = 16;

  static const List<int> choices = <int>[num1, num2, num3, num4];
}

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);

  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  bool img = false;
  int? numberOfPlayers = 10;
  bool isTrue = true;
  XFile? image;
  late Future<bool> fetchedUser;
  late String id;
  late String typeSport;
  late SharedPreferences prefs;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = XFile(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  @override
  void choiceAction(int choice) {
    setState(() {
      numberOfPlayers = choice;
    });
  }

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    typeSport = prefs.getString("typeSport")!;

    setState(() {});

    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    String _about = "";
    String _name = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text(
          "Create your team",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: appBarTitleSize),
        ),
      ),
      body: FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 18, right: 16),
                            child: Container(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: themeColor,
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundImage: image == null
                                      ? null
                                      : FileImage(File(image!.path)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                pickImage(ImageSource.gallery);
                              });
                            },
                            child: Text(
                              "click here to insert your team logo",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: themeColor),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Team name ",
                          style: TextStyle(
                              fontSize: 24,
                              color: themeColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 5, offset: Offset(0, 1))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(border: Border()),
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'About is Required';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    _about = value!;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Enter team name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "About us ",
                          style: TextStyle(
                              fontSize: 24,
                              color: themeColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 5, offset: Offset(0, 1))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(border: Border()),
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'name is Required';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    _name = value!;
                                  },
                                  minLines: 5,
                                  maxLines: 9,
                                  decoration: InputDecoration(
                                      hintText:
                                          "Enter a quick description here ",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            _formKey.currentState!.save();

                            print("Ena image " + image!.path.toString());
                            print("Ena about " + _about);
                            print("Ena name " + _name);



                            var res = await TeamService().CreateTeam(
                                id, image?.path, _name, _about, typeSport);
                            if (res == "duplicated") {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("Information"),
                                    content: Text("Team already existing"),
                                  );
                                },
                              );
                            } else if (res == "error") {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("Information"),
                                    content: Text("Connexion problem !"),
                                  );
                                },
                              );
                            } else {
                              setState(() {
                                haveTeam = true;
                              });
                              print("success");
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.futbol,
                              color: themeColor,
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xff126415), Color(0xff5bb85f)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.futbol,
                              color: themeColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
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
