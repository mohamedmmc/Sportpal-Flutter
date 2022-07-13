import 'package:flutter/material.dart';

import '../../../../variables.dart';
import 'ShowTournamentMatchDetails.dart';


class Round8FinalScreen extends StatefulWidget {
  const Round8FinalScreen({Key? key}) : super(key: key);

  @override
  _Round8FinalScreenState createState() => _Round8FinalScreenState();
}

class _Round8FinalScreenState extends State<Round8FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.all(6),
      child: ListView.builder(
        itemCount: 8,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.grey,
                    offset: Offset(0, 6),
                  ),
                ]),
            child: InkWell(
              onTap: () {
                //TODO GO TO MATCH DETAILS
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowTournamentMatchDetails()));
              },
              splashColor: Colors.blue[200],
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(width: 2,color: Colors.green),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      image: DecorationImage(
                                          image:
                                          selectedSport == "tennis" ? NetworkImage("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/134406410_10220558388322106_27933639126927387_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=y0wukoLyYwIAX_A2FkN&tn=UmE5QBE7PFsz8hlq&_nc_ht=scontent.ftun8-1.fna&oh=00_AT-hZhWL4Sdoj0sXotD_mDEyqBxaN93lZRzAEXJuClT96g&oe=628C83C9") : NetworkImage("https://upload.wikimedia.org/wikipedia/fr/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png"))),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  selectedSport == "tennis" ? "Gouider seif ": "Real Madrid",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(width: 2,color: Colors.green),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                      image: DecorationImage(
                                          image:
                                          selectedSport =="tennis"?NetworkImage("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/93998046_3174161915968288_587966424228560896_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=0Iv2LK4gpyAAX_IKnAh&_nc_ht=scontent.ftun8-1.fna&oh=00_AT8o6gzrC6E9353aG65Pj6TQI0vUfLZ68PZgS0lFArcAew&oe=628A8EDF"): NetworkImage("https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png"))),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  selectedSport == "tennis" ? "Ghazi Yahia" : "Liverpool",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
