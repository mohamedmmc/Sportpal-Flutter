import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';

class CompleteProfilFootPage extends StatefulWidget {
  const CompleteProfilFootPage({Key? key}) : super(key: key);

  @override
  _CompleteProfilFootPageState createState() => _CompleteProfilFootPageState();
}

class _CompleteProfilFootPageState extends State<CompleteProfilFootPage> {
  List<String> chipListLeg = [
    "Left leg",
    "Right leg",
  ];
  List<String> chipListRole = [
    "Attack",
    "Center",
    "Defense",
    "GoalKeeper",
  ];
  List<String> chipListPostion = [
    "Top",
    "Center",
    "Bottom",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Color(0x802196F3),
          child: SingleChildScrollView(
            child: Container(
              width: 350,
              height: 527,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    //color: new Color(0xffffc107),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: themeColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.futbol),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Complete info',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(FontAwesomeIcons.futbol)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 9),
                      child: Text(
                        'Select your role',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ),
                  Container(
                      child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      choiceChipWidget(chipListRole),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Select your strong leg',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ),
                  Container(
                      child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      choiceChipWidget(chipListLeg),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Select your prefered position',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ),
                  Container(
                      child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      choiceChipWidget(chipListPostion),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Enter your Idol Player',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                  ),
                  Container(child: TextField()),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
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
                            // TODO Save about me football informations
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  choiceChipWidget(this.reportList);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: footballColorSecondary,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
