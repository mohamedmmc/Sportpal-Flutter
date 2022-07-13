import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/Match/widgets/common_widgets.dart';
import 'package:sportpal/Model/Matche.dart';
import 'package:sportpal/Model/Notification.dart' as notif;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Service/MatchService.dart';
import '../../../Service/NotificationService.dart';
import 'MatchRequestsScreen.dart';


class PendingMatchsScreen extends StatefulWidget {
  const PendingMatchsScreen({Key? key}) : super(key: key);

  @override
  _PendingMatchsScreenState createState() => _PendingMatchsScreenState();
}

class _PendingMatchsScreenState extends State<PendingMatchsScreen> {
  late Future<bool> fetchedUser;
  late String id;
  final List<Matche> matchs = [];
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;

    var test = await MatchService().getMatchs(id);
    test?.forEach((element) {
      matchs.add(element);
    });

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
  final double _borderRadius = 20.0;


  Widget build(BuildContext context) {
    return Scaffold(
      body: buildRequest(),
    );
  }

  buildRequest() {
    return FutureBuilder(
        future: fetchedUser ,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: matchs.length,
              itemBuilder: (context,index){
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [

                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(_borderRadius),
                                gradient: LinearGradient(
                                    colors: [Color(0xffFFB157), Color(0xffFFA057)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xffFFB157), blurRadius: 12, offset: Offset(0, 6))
                                ]),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(
                                  _borderRadius, Color(0xffc76b33), Color(
                                  0xffe09f37)),
                            ),
                          ),


                        Positioned.fill(
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              if(id != matchs[index].teamA?.players[0]!.id!)...[
                                Expanded(
                                  flex: 2,

                                  child: Image.network(
                                    matchs[index].teamA!.players[0]!.profilePic!,
                                    height: 120,
                                    width: 100,
                                  ),
                                ),
                              ]else...[
                                Expanded(
                                  flex: 2,

                                  child: Image.network(
                                    matchs[index].teamB!.players[0]!.profilePic!,
                                    height: 120,
                                    width: 100,
                                  ),
                                ),
                              ],

                              SizedBox(width: 5,),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if(id==matchs[index].teamA?.players[0]!.id!)...[
                                      Text(
                                        matchs[index].teamB!.players[0]!.fullName!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]else...[
                                      Text(
                                        matchs[index].teamA!.players[0]!.fullName!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],

                                    Text(
                                      matchs[index].date!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    // if (news[index].to[0]!.address!.isNotEmpty)...[
                                    //   Row(
                                    //     children: [
                                    //       Icon(Icons.location_on,
                                    //           size: 16, color: Colors.white),
                                    //       SizedBox(
                                    //         width: 8,
                                    //       ),
                                    //
                                    //       Text(
                                    //         "Unknown",
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontWeight: FontWeight.w500,
                                    //         ),
                                    //       )
                                    //     ],
                                    //
                                    //   ),
                                    // ],


                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // if(news[index].to[0]?.rating!=null)...[
                                    //   Text(
                                    //     news[index].to[0]!.rating!,
                                    //     style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.w500,
                                    //     ),
                                    //   ),
                                    //   RatingBar(rating: double.parse(news[index].to[0]!.rating!) ),
                                    // ] else...[
                                    //   Text(
                                    //     "New player",
                                    //     style: TextStyle(
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.w500,
                                    //     ),
                                    //   ),
                                    //   RatingBar(rating:1),
                                    // ],


                                    SizedBox(height: 8,),




                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}




class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);
    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}