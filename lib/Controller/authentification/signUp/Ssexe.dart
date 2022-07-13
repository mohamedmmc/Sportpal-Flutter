import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signUp/Spassword.dart';
import 'package:sportpal/Controller/authentification/signUp/Sphotoprofil.dart';
import '../authentificationWidgets/Widgets/customInputBox.dart';



class RegisterSexe extends StatefulWidget {
  const RegisterSexe({Key? key, required this.email, required this.name, required this.phone, required this.birthDate}) : super(key: key);

final String email;
final String name;
final String phone;
final DateTime birthDate;
  @override
  _RegisterSexeState createState() => _RegisterSexeState();
}

class _RegisterSexeState extends State<RegisterSexe> {

  String _gender =  "";
  bool isTrue = false;
  Future<void> _continueBtnColor() async {
    setState(() {
      isTrue = true;
    });
  }

  bool  isManTrue = false;
  bool  isWomanTrue = false;

  Future<void> _ButtoncolorMan() async {
    setState(() {
      _gender = "homme";
      isManTrue=true;
      isWomanTrue=false;
    });
  }
  Future<void> _ButtoncolorWoman() async {
    setState(() {
      _gender = "woman";
      isManTrue=false;
      isWomanTrue=true;
    });
  }

  @override
  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    bool isActive = false;

    bool Ff = true;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Padding(padding:  EdgeInsets.fromLTRB(20, 60, 0, 0)
              ,child: Row(
                children: [
                  Text(
                    "Selecting"
                        "\nmy gender",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.blue[800],
                        fontSize: 35,
                        fontFamily: 'Cardo'
                    ),
                  ),
                  SizedBox(width: 45,),
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
            InkWell(
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  border: Border.all(
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: isManTrue ? Color.fromRGBO(49, 39, 79, 1) : Colors.white,
                ),
                child: Center(
                  child: Text("Man", style: TextStyle(letterSpacing: 3,
                    color: isManTrue ? Colors.white : Color.fromRGBO(49, 39, 79, 1),
                  ),),
                ),
              ),
              onTap: (){
                _continueBtnColor();
                _ButtoncolorMan();
              },
            ),
            SizedBox(height: 18,),
            InkWell(
              onTap: () {
                _continueBtnColor();
                _ButtoncolorWoman();
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  border: Border.all(
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: isWomanTrue ?  Color.fromRGBO(49, 39, 79, 1) : Colors.white  ,
                ),
                child: Center(
                  child: Text("Woman", style: TextStyle(
                      color: isWomanTrue ? Colors.white : Color.fromRGBO(49, 39, 79, 1)   ,
                    letterSpacing: 3
                  ),),
                ),
              ),
            ),

            SizedBox(height: 200,),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPhotoprofil(phone: widget.phone,email: widget.email,name: widget.name,gender: _gender,birthDate: widget.birthDate,)));
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

}
