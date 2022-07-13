import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Controller/screens/Match/widgets/common_widgets.dart';
import 'package:sportpal/Model/Notification.dart' as notif;
import 'package:sportpal/Service/MatchService.dart';
import 'package:sportpal/Service/NotificationService.dart';



class MatchRequestScreen extends StatefulWidget {
  const MatchRequestScreen({Key? key}) : super(key: key);

  @override
  _MatchRequestScreenState createState() => _MatchRequestScreenState();
}

class _MatchRequestScreenState extends State<MatchRequestScreen> {
  late Future<bool> fetchedUser;
  late String id;
  final List<notif.Notification> news = [];
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;

    var test = await NotificationService().getNotifications(id);
    test?.forEach((element) {
      if(!element.accept){
        if(element.type! == "Match request" && id!=element.from!.id){
          news.add(element);

        }

      }
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
  // var items = [
  //   MatchInfo("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/134406410_10220558388322106_27933639126927387_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=MYvFfm1xax0AX8Za-OQ&tn=UmE5QBE7PFsz8hlq&_nc_ht=scontent.ftun8-1.fna&oh=00_AT_SBNaeec8bcIrqud2mUzGnWCqIFnJZZaKkTut5Nbc2PQ&oe=626CDFC9","Gouider Seifeddine", "MVP for 5 seasons", "Ben Arous ", 4.9),
  //   MatchInfo("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/43750713_1977571078971268_2566341812327284736_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=wSpC2AoYKt0AX8lct0k&_nc_ht=scontent.ftun8-1.fna&oh=00_AT87_EUb60L0XGJrD07YbUcX1T_Pgk2F8-f-uHY02py9IQ&oe=626CFDC7","Ahmed", "MVP for 1 seasons", "SIDI RZIG", 3.4),
  //   MatchInfo("https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/273835028_698373714655542_966344241244408097_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=KQuH_WvCPmkAX-wmRBW&_nc_ht=scontent.ftun8-1.fna&oh=00_AT90txyd5vbZKBZPM5_z4ImwtEIa4uCWDv_6sjdIL_T0jA&oe=624C0DB3","Khaled", "MVP for 3 seasons", "Chargueya", 4.2),
  //   MatchInfo("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/94105263_2582735275333178_5224744676686299136_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=WKKb1HniVVYAX8sA0hw&_nc_ht=scontent.ftun8-1.fna&oh=00_AT_Jq9tTidZnVMkUr0qCHeZb1lk9qguIbaJZSKMmIaCopQ&oe=626C65D9","Salah", "MVP for 2 seasons", "Rades", 3.4),
  //   MatchInfo("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/51982056_2480244275336321_2897163948929318912_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=BCOoenl9koIAX83X45p&tn=UmE5QBE7PFsz8hlq&_nc_ht=scontent.ftun8-1.fna&oh=00_AT9sjdOwn5Hkgo4F6Kpr8Zo-Tar68EmD3vxAWSHrPA-bDw&oe=626D73A7","Hbib", "MVP for 2 seasons", "Megrine", 2.4),
  //   MatchInfo("https://scontent.ftun8-1.fna.fbcdn.net/v/t39.30808-6/256343943_3104945723119099_3208948590705484240_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=OBqzTsCCdSUAX-l4zoJ&_nc_ht=scontent.ftun8-1.fna&oh=00_AT-L8hEYhKvtaKMmz1OJTle0rhaoGrYIfk5_EA0HjiWuUg&oe=624B77A2","aziz", "MVP for 0 seasons", "Ben Arous ", 1.4),
  //
  // ];

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
              itemCount: news.length,
              itemBuilder: (context,index){
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        if(id==news[index].to[0]!.id!)...[
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(_borderRadius),
                                gradient: LinearGradient(
                                    colors: [Color(0xffD76EF5), Color(0xff8F7AFE)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xffD76EF5), blurRadius: 12, offset: Offset(0, 6))
                                ]),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(
                                  _borderRadius, Color(0xffD76EF5), Color(0xff8F7AFE)),
                            ),
                          ),

                        ]else...[
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(_borderRadius),
                                gradient: LinearGradient(
                                    colors: [Color(0xff567fc7), Color(
                                        0xff4c96c6)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff7b94b4), blurRadius: 12, offset: Offset(0, 6))
                                ]),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(
                                  _borderRadius, Color(0xff1757c7), Color(
                                  0xffadb7c6)),
                            ),
                          ),
                        ],


                        Positioned.fill(
                          child: Row(
                            children: [
                              SizedBox(width: 5,),
                              if(id != news[index].from!.id!)...[
                                Expanded(
                                  flex: 2,

                                  child: Image.network(
                                    news[index].from!.profilePic!,
                                    height: 120,
                                    width: 90,
                                  ),
                                ),
                              ]else...[
                                Expanded(
                                  flex: 2,

                                  child: Image.network(
                                    news[index].to[0]!.profilePic!,
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
                                if(id==news[index].from!.id!)...[
                                  Text(
                                    news[index].to[0]!.fullName!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]else...[
                                  Text(
                                    news[index].from!.fullName!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],

                                    Text(
                                      news[index].type!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  if (news[index].to[0]!.address!.isNotEmpty)...[
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.white),
                                        SizedBox(
                                          width: 8,
                                        ),

                                        Text(
                                          "Unknown",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],

                                    ),
                                    ],


                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if(news[index].to[0]?.rating!=null)...[
                                      Text(
                                        news[index].to[0]!.rating!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      RatingBar(rating: double.parse(news[index].to[0]!.rating!) ),
                                    ] else...[
                                      Text(
                                        "New player",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      RatingBar(rating:1),
                                    ],


                                    SizedBox(height: 8,),
                                    if(news[index].from!.id != id)...[
                                      Row(
                                        children: [
                                          SizedBox(width: 18,),
                                          IconButton(onPressed: ()async{
                                            if(id == news[index].to[0]!.id!) {
                                              var confirm = await NotificationService()
                                                  .confirmNotif(
                                                  news[index].from!.id!, id);
                                              print(confirm);
                                              if (confirm ==
                                                  "friendRequestAcepted") {
                                                //var eldenLord = "";
                                                //if(id==news[index])
                                                var sendMatch = await MatchService().createIndivMatch(id, news[index].from!.id!, DateTime.now(), news[index].terrain!,news[index].id!);
                                                setState(() {
                                                  news.removeAt(index);
                                                });
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return const AlertDialog(
                                                      title: Text("Information"),
                                                      content: Text("Error server"),
                                                    );
                                                  },
                                                );
                                              }
                                            }
                                          }, icon: Icon(Icons.check_circle,color: Colors.green,size: 32,)),
                                          IconButton(onPressed: ()async{
                                            var deletedNotif = await NotificationService().deleteMYnotif(id, news[index].from!.id!);
                                            print(deletedNotif);
                                            setState(() {
                                              news.removeAt(index);
                                            });
                                          }, icon: Icon(Icons.delete,color: Colors.red,size: 32,)),
                                        ],
                                      )
                                    ]else...[
                                      IconButton(onPressed: () async{
                                        var deletedNotif = await NotificationService().deleteMYnotif(id, news[index].to[0]!.id!);
                                        print(deletedNotif);
                                        setState(() {
                                          news.removeAt(index);
                                        });
                                      }, icon: Icon(Icons.delete,color: Colors.red,size: 32,)),
                                    ],

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

class MatchInfo{
  final String urlImage;
  final String name;
  final String category;
  final String location;
  final double rating;

  MatchInfo(this.urlImage,this.name, this.category, this.location, this.rating );
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