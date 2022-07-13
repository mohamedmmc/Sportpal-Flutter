import 'package:flutter/material.dart';
import 'package:sportpal/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/Complexe.dart';
import '../../../Model/Terrain.dart';
import '../../../Service/ComplexeService.dart';
import '../../../variables.dart';
import 'Widgets/StadiumCard.dart';



class StadiumListScreen extends StatefulWidget {
  const StadiumListScreen({Key? key, required this.terrains}) : super(key: key);

  final List<Terrain> terrains;
  @override
  _StadiumListScreenState createState() => _StadiumListScreenState();
}

class _StadiumListScreenState extends State<StadiumListScreen> {


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
        body: ListView.builder(
            itemCount: widget.terrains.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: ()async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("stadium", widget.terrains[index].id!);
                      Stadium = widget.terrains[index].id!;

                      Navigator.pop(context);
                    },

                    child: StadiumCard(description: widget.terrains[index].typeSport!,imageUrl: widget.terrains[index].picture!),
                  ),
                  SizedBox(height: 10,),
                ],
              );
            })
    );
  }
}
