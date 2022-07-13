import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';

class FootConstants {
  static const int num1 = 8;
  static const int num2 = 16;
  static const int num3 = 32;
  static const int num4 = 64;

  static const List<int> choices = <int>[num1, num2, num3, num4];
}

class CreateTournementScreen extends StatefulWidget {
  const CreateTournementScreen({Key? key}) : super(key: key);

  @override
  _CreateTournementScreenState createState() => _CreateTournementScreenState();
}

class _CreateTournementScreenState extends State<CreateTournementScreen> {
  int? numberOfMatchs = 8;
  DateTime date = DateTime(2022, 03, 20);
  DateTime date1 = DateTime(2022, 03, 20);

  @override
  void choiceAction(int choice) {
    setState(() {
      numberOfMatchs = choice;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text(
          "Create tournement",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: appBarTitleSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Big event",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 3, offset: Offset(0, 1))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border()),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter tournement name",
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
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Nbr of players in your tournement",
                      style: TextStyle(
                          wordSpacing: 1,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    PopupMenuButton<int>(
                      icon: Icon(
                        FontAwesomeIcons.caretSquareDown,
                        size: 30,
                      ),
                      onSelected: choiceAction,
                      itemBuilder: (BuildContext context) {
                        return FootConstants.choices.map((int choice) {
                          return PopupMenuItem<int>(
                            value: choice,
                            child: Text(choice.toString()),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  numberOfMatchs.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.blue[800]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate==null) return;
                        setState(() {
                          date = newDate;
                        });
                      },
                      child: Text("From")),
                  SizedBox(width: 68,),
                  ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () async {
                        DateTime? endDate = await showDatePicker(
                            context: context,
                            initialDate: date1,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (endDate==null) return;
                        setState(() {
                          date1 = endDate;
                        });
                      },
                      child: Text("To")),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${date.year}/${date.month}/${date.day}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 40,),
                  Text(
                    "${date1.year}/${date1.month}/${date1.day}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 3, offset: Offset(0, 1))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(border: Border()),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Prize pool",
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
                onTap: () {
                  //TODO tournement creation
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.trophy,
                      color: Colors.blue[500],
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[500]),
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
                      FontAwesomeIcons.trophy,
                      color: Colors.blue[500],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
