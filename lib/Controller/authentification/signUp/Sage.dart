import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sportpal/constants.dart';

import 'Sphone.dart';




class RegisterAge extends StatefulWidget {
  const RegisterAge({Key? key, required this.email, required this.name}) : super(key: key);
  final String email;
  final String name;
  @override
  _RegisterAgeState createState() => _RegisterAgeState();
}

class _RegisterAgeState extends State<RegisterAge> {
  DateTime birthDate = DateTime.now();
  int? age;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Padding(padding: const EdgeInsets.fromLTRB(30, 60, 0, 0)
              ,child: Row(
                children: [
                  Text(
                    "My"
                        "\nAge is",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: appcolor,
                        fontSize: 35,
                        fontFamily: 'Cardo'
                    ),
                  ),
                  SizedBox(width: 75,),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        image:
                        DecorationImage(image: NetworkImage("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.15752-9/276125676_342231811294745_2822157271872426945_n.png?_nc_cat=106&ccb=1-5&_nc_sid=ae9488&_nc_ohc=Uwbhr5PlpPIAX-BiY-A&_nc_ht=scontent.ftun8-1.fna&oh=03_AVIaYxAH1AVLHbxVTYBnCrI8V-hJ-bV9TdPAtp_KRQv16w&oe=62987D8C"))),
                  )
                ],
              ),),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Center(
                child: Column(

                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _selectDate(context);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff3a4aa6), Color(0xff2095f3)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius:
                            BorderRadius.circular(50)),
                        child: Text(
                          "Select your birthday",
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(DateFormat("yyyy-MM-dd").format(birthDate),style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),),
                    SizedBox(height: 40,),
                    Text("your age is "+age.toString(),style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
              ),
            ),



            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your age will be public ',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8f9db5).withOpacity(0.65),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 140,),
            Center(
              child: InkWell(
                onTap: (){
                  print("owa owa owa");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPhone(name: widget.name,email: widget.email,birthDate: birthDate,)));
                  setState(() {
                    isTrue = !isTrue;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: scrWidth * 0.80,
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isTrue ? Color(0xff0962ff) : Colors.grey,
                    ),
                    gradient: LinearGradient(
                      colors: isTrue ? [Color(0xff1e2757), Color(0xff2095f3)] : [Colors.white, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isTrue ?  Colors.white : Colors.grey ,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
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
        age = DateTime.now().year-selected.year;
        birthDate = selected;
        isTrue = true;
      });
    }
  }
}
