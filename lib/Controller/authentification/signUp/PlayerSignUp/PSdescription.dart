import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signIn.dart';
import 'package:sportpal/Controller/authentification/signUp/Sname.dart';
import 'package:sportpal/Controller/authentification/signUp/Sphone.dart';
import '../../authentificationWidgets/Widgets/customInputBox.dart';



class RegisterDescription extends StatefulWidget {
  const RegisterDescription({Key? key}) : super(key: key);

  @override
  _RegisterDescriptionState createState() => _RegisterDescriptionState();
}

class _RegisterDescriptionState extends State<RegisterDescription> {
  @override
  Widget build(BuildContext context) {

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;
    bool isTrue = false;


    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            LinearProgressIndicator(
              backgroundColor: Colors.white,
              value: 1,
              color: Color(0xff0962ff),
            ),

            Padding(padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
              child: Text(
                "My",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            Padding(padding: const EdgeInsets.fromLTRB(30, 10, 0, 0)
              ,child: Text(
                "Description is ",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.blue[800],
                    fontSize: 35,
                    fontFamily: 'Cardo'
                ),
              ),),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "Description",
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 185,),
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
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
                    color: isTrue ? Color(0xff0962ff) : Colors.white,
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
