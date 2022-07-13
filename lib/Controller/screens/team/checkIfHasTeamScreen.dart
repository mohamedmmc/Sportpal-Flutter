import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/team/createTeamScreen.dart';

class CheckIfHasTeamScreen extends StatefulWidget {
  const CheckIfHasTeamScreen({Key? key}) : super(key: key);

  @override
  _CheckIfHasTeamScreenState createState() => _CheckIfHasTeamScreenState();
}

class _CheckIfHasTeamScreenState extends State<CheckIfHasTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showDialog(context: context, builder: (context) => CustomDialog(
              title: "No team yet",
              description: "You do not have a team yet !\n you can either create a team or join a team",
            ));
          },
          child: Text("Click me"),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String? title, description, buttonText;
  final Image? image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: DialogContent(context),
    );
  }

  DialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                description!,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff126415), Color(0xff5bb85f)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )
                        ,
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Join",
                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTeamScreen()));

                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff126415), Color(0xff5bb85f)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )
                        ,
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Create",
                          style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
        Positioned(
          top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 50,
            )
        )
      ],
    );
  }
}
