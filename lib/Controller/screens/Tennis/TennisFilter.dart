import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/home/home.dart';
import 'package:sportpal/variables.dart';
import '../../../constants.dart';



class TennisFilter extends StatefulWidget {
  @override
  _TennisFilterState createState() => _TennisFilterState();
}

class _TennisFilterState extends State<TennisFilter> {

  var SliderValue = 0.0;

  late  bool checkBoxValueFemale=false;
  late  bool checkBoxValueMale=true;

  int selectedIndex = 0;
  var values = RangeValues(22.0, 40.0);
  var values2 = RangeValues(3.0, 10.0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[400],
        title: Text(
          'SportPAL',
          style: TextStyle(fontSize: appBarTitleSize, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Text("Filter your matchs ",style: TextStyle(
                    fontSize: 32,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cardo'
                  ),),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 80,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    //TODO change color
                  },
                  child: Container(
                    height: 50,
                    width: 85,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: selectedIndex == 0
                            ? Colors.amberAccent[400]
                            : Colors.blue[600]),
                    child: Center(
                      child: Text(
                        "Player",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 85,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: selectedIndex == 1
                            ? Colors.amberAccent[400]
                            : Colors.blue[600]),
                    child: Center(
                      child: Text(
                        "Coach",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Text(
                    "Gender",
                    style: TextStyle(
                        fontFamily: 'cardo',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Checkbox(
                    value: checkBoxValueMale,
                    onChanged: (bool? value){
                      if(checkBoxValueMale){
                        setState(() {

                          checkBoxValueMale = false;
                          checkBoxValueFemale=false;
                          genderFilter = "";

                        });
                      }else{
                        setState(() {
                          checkBoxValueMale = true;
                          checkBoxValueFemale=false;
                          genderFilter = "homme";

                        });
                      }


                    },
                  ),
                ),
                Text(
                  "Man",
                  style: TextStyle(
                    fontFamily: 'cardo',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:38.0),
                  child: Checkbox(
                    value: checkBoxValueFemale,

                    onChanged: (bool? value){
                        if(checkBoxValueFemale){
                          setState(() {
                            checkBoxValueFemale=false;
                            checkBoxValueMale=false;
                            genderFilter = "";
                          });
                        }else{
                          setState(() {
                            checkBoxValueFemale=true;
                            checkBoxValueMale=false;
                            genderFilter = "woman";
                          });
                        }

                    },
                  ),
                ),
                Text(
                  "Woman",
                  style: TextStyle(
                    fontFamily: 'cardo',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Text(
                    "Radius",
                    style: TextStyle(
                        fontFamily: 'cardo',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 100,
                    label: "$SliderValue klm",
                    value: SliderValue,
                    onChanged: (newValue) {
                      setState(() {
                        print('$SliderValue');
                        SliderValue = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Text(
                    "Age",
                    style: TextStyle(
                        fontFamily: 'cardo',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: RangeSlider(
                    min: 15.0,
                    max: 70.0,
                    divisions: 55,

                    values: values,

                    onChanged: (newValue) {
                      setState(() {
                        print(values);
                        values= newValue;
                        age = newValue;
                      });
                      },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Text(
                    "SkillLevel",
                    style: TextStyle(
                      fontFamily: 'cardo',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  child: RangeSlider(
                    min: 0,
                    max: 20,
                    values: values2,
                    divisions: 20,
                    onChanged: (newValue) {
                      setState(() => values2 = newValue);
                    },
                    labels: RangeLabels(
                        values2.start.toString(), values2.end.toString()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2()));
            }, child: Text("Filter"))
          ],
        ),
      ),
    );

  }
}