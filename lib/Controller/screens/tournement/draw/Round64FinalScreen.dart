import 'package:flutter/material.dart';

class Round64FinalScreen extends StatefulWidget {
  const Round64FinalScreen({Key? key}) : super(key: key);

  @override
  _Round64FinalScreenState createState() => _Round64FinalScreenState();
}

class _Round64FinalScreenState extends State<Round64FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.all(6),
      child: ListView.builder(
        itemCount: 64,
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
                                          NetworkImage("https://upload.wikimedia.org/wikipedia/fr/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png"))),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  "Real Madrid",
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
                                          NetworkImage("https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png"))),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  "Liverpool",
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
