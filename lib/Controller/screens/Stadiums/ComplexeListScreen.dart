import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/Stadiums/StadiumListScreen.dart';
import 'package:sportpal/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/Complexe.dart';
import '../../../Service/ComplexeService.dart';
import 'Widgets/StadiumCard.dart';



class ComplexeListScreen extends StatefulWidget {
  const ComplexeListScreen({Key? key}) : super(key: key);

  @override
  _ComplexeListScreenState createState() => _ComplexeListScreenState();
}

class _ComplexeListScreenState extends State<ComplexeListScreen> {
  late Future<bool> fetchedUser;
  late String fullname;
  late String id;
  late String email;
  late String telNum;
  late String age;
  late String profilePic;
  late SharedPreferences prefs;
  final List<Complexe> listComplexe = [];

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();

    fullname = prefs.getString("fullName")!;
    email = prefs.getString("email")!;

    id = prefs.getString("_id")!;
    if (prefs.getString("birthDate") != null){
      age = prefs.getString("birthDate")!;
    }if (prefs.getString("telNum") != null){
      telNum = prefs.getString("telNum")!;
    }

    profilePic = prefs.getString("profilePic")!;
    await ComplexeService().getComplexes(listComplexe);
    setState(() {

    });
    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: footballColorPrimary,
        title: Text("stadiums",style: TextStyle(
            fontSize: appBarTitleSize
        ),),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchedUser ,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: listComplexe.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StadiumListScreen(terrains: listComplexe[index].terrains!,)));
                            },
                            child: StadiumCard(description: listComplexe[index].name!,imageUrl: listComplexe[index].picture!)),
                        SizedBox(height: 10,),
                      ],
                    );
                  });
            }
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}