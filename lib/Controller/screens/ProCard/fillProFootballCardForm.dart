import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/ProCard/GenerateProCardFootball.dart';
import 'package:sportpal/Controller/screens/ProCard/GenerateProCardTennis.dart';

import '../../../constants.dart';
import '../../../variables.dart';

class fillProFootballCardForm extends StatefulWidget {
  const fillProFootballCardForm({Key? key}) : super(key: key);

  @override
  _fillProFootballCardFormState createState() => _fillProFootballCardFormState();
}

class _fillProFootballCardFormState extends State<fillProFootballCardForm> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    String serve = "" ;
    String forehand = "" ;
    String backhand = "" ;
    String slice = "" ;
    String volley = "" ;
    String dropshot = "" ;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          "Professional Card",
          style: TextStyle(
            fontSize: appBarTitleSize,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "fill out your form",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: appcolor),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Enter your Pace speed : ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border()),
                            child: TextFormField(
                              validator: (String? value ){
                                if (value!.isEmpty){
                                  return 'required';
                                }
                              },
                              onSaved: (String? value){
                                setState(() {
                                  serve = value!;
                                });
                              },
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  helperText: "/100",
                                  helperStyle: TextStyle(),
                                  hintText: "0",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 220,
                      child: Text(
                        "Enter your passing skills : ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border()),
                            child: TextFormField(
                              validator: (String? value ){
                                if (value!.isEmpty){
                                  return 'required';
                                }
                              },
                              onSaved: (String? value){
                                backhand = value!;
                              },
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  helperText: "/100",
                                  helperStyle: TextStyle(),
                                  hintText: "0",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 220,
                      child: Text(
                        "Enter your shooting power : ",

                        overflow: TextOverflow.ellipsis,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border()),
                            child: TextFormField(
                              validator: (String? value ){
                                if (value!.isEmpty){
                                  return 'required';
                                }
                              },
                              onSaved: (String? value){
                                forehand = value!;
                              },

                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  helperText: "/100",
                                  helperStyle: TextStyle(),
                                  hintText: "0",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 220,
                      child: Text(
                        "Enter your dribbling skills : ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border()),
                            child: TextFormField(
                              validator: (String? value ){
                                if (value!.isEmpty){
                                  return 'required';
                                }
                              },
                              onSaved: (String? value){
                                slice = value!;
                              },
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  helperText: "/100",
                                  helperStyle: TextStyle(),
                                  hintText: "0",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 220,
                      child: Text(
                        "Enter your defending skills : ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border()),
                            child: TextFormField(
                              validator: (String? value ){
                                if (value!.isEmpty){
                                  return 'required';
                                }
                              },
                              onSaved: (String? value){
                                volley = value!;
                              },
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  helperText: "/100",
                                  helperStyle: TextStyle(),
                                  hintText: "0",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 220,
                      child: Text(
                        "Enter your physical power : ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(blurRadius: 5, offset: Offset(0, 2))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border()),
                            child: TextFormField(
                              validator: (String? value ){
                                if (value!.isEmpty){
                                  return 'required';
                                }
                              },
                              onSaved: (String? value){
                                dropshot = value!;
                              },
                              style: TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  helperText: "/100",
                                  helperStyle: TextStyle(),
                                  hintText: "0",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {

                  if (!_formKey.currentState!.validate()) {
                    return;

                  }else{
                    _formKey.currentState!.save();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateProCardFootball(pace: serve,shooting: backhand,passing: forehand,dribbling: slice,defending: volley,physical: dropshot,)));
                  }

                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff126415), Color(0xff5bb85f)] ,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )
                    ,
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(49, 39, 79, 1),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white,fontSize: 24),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}
