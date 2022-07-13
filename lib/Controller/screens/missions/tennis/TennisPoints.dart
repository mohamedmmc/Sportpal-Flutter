import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';


class TennisPointsScreen extends StatefulWidget {
  const TennisPointsScreen({Key? key}) : super(key: key);

  @override
  _TennisPointsScreenState createState() => _TennisPointsScreenState();
}

class _TennisPointsScreenState extends State<TennisPointsScreen> {
  late Future<bool> fetchedUser;
  late String fullname;
  late String profilPic;
  late Set<String> a;
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    a=prefs.getKeys();
    fullname = prefs.getString("fullName")!;
    profilPic = prefs.getString("profilePic")!;

    print(a);
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
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Column(
          children: [
            FutureBuilder(
              future: fetchedUser,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if(snapshot.hasData) {

                  return InkWell(
                    onTap: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
                    },
                    child: ListTile(
                      title: Text(
                        "Professional points of ",style: kNonActiveTabStyle,textAlign: TextAlign.end,
                      ),
                      subtitle: Text(
                        fullname,
                        textAlign: TextAlign.end,
                        style: kActiveTabStyle,

                      ),
                      trailing: Container(
                        width: 60,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: true ? NetworkImage(profilPic) : AssetImage('assets/images/footnews1.png') as ImageProvider,
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ),
                  );


                }
                else {
                  return const Center(

                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          //border: TableBorder.all(),
          columns: const [
            DataColumn(
              label: Text("Skill",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            ),
            DataColumn(label: Text("missions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24))),
            DataColumn(label: Text("Score",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)), numeric: true),
          ],
          rows: [
            DataRow(cells: [
              DataCell(
                  Text("Serve" , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.blue[900]),),
              ),
               DataCell(
                  Center(
                    child: Text(
                      "12/18",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        color: Colors.blue[900],
                          ),
                    ),
                  )),
              DataCell(
                Center(
                  child: Text(
                    "32",
                    style: TextStyle(
                      color: Colors.blue[900],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ]),
            DataRow(cells: [
            DataCell(
            Text("Forehand" , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blue[800],),),
            ),
              DataCell(Center(
                child: Text("22/32",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    color: Colors.blue[800],),),
              )),
              DataCell(Center(
                child: Text("46",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    color: Colors.blue[800],),),
              )),

            ]),
            DataRow(cells: [
              DataCell(
                Text("Backhand" , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16, color: Colors.blue[600],),),
              ),
              DataCell(Center(
                child: Text("20/28", style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    )),
              )),
              DataCell(Center(
                child: Text("42", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  color: Colors.blue[600],)),
              )),

            ]),
            DataRow(cells: [
              DataCell(
                Text("Volley" , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blue[400],),),
              ),
              DataCell(Center(child: Text("20/24",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400],)))),
              DataCell(Center(child: Text("30",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[400],)))),
            ]),
            DataRow(cells: [
              DataCell(
                Text("Slice" , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blue[300],),),
              ),
              DataCell(Center(child: Text("18/20",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[300])))),
              DataCell(Center(child: Text("28",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[300])))),
            ]),
            DataRow(cells: [
              DataCell(
                Text("Dropshot" , style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blue[100]),),
              ),
              DataCell(Center(child: Text("10/12",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[200])))),
              DataCell(Center(child: Text("20",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.blue[200])))),
            ]),
          ],
        ),
      ),
    );
  }
}
