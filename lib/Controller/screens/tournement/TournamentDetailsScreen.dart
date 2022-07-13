import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/Stadiums/Widgets/StadiumCard.dart';
import 'package:sportpal/Model/Tournament.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';
import '../../../Service/TournamentService.dart';
import '../wallet/payment/PaymentCard.dart';
import '../wallet/payment/checkout.dart';
import 'draw/TournamentDrawScreen.dart';


import 'package:shared_preferences/shared_preferences.dart';


class TournamentDetailsScreen extends StatefulWidget {

  const TournamentDetailsScreen({Key? key,required this.tournement}) : super(key: key);
  final Tournament tournement;
  @override
  _TournamentDetailsScreenState createState() => _TournamentDetailsScreenState();
}

class _TournamentDetailsScreenState extends State<TournamentDetailsScreen> {

  bool payed = false;


  final qrKey = GlobalKey(debugLabel: 'QR');

  bool pressedStar = false;
  late String team ;
  late SharedPreferences prefs;
  late Future<bool> fetchedUser;
  late String id;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    if(prefs.getString("team0")!=null){
      team=prefs.getString("team0")!;
    }else{
      team="noteam";
    }
    return true;
  }
  @override
  void initState() {
    fetchedUser= fetchUser();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: IconButton(
                  onPressed: (){
                    setState(() {
                      pressedStar = true;
                    });
                    //todo add tournament to bookmark
                  },
                  icon: !pressedStar ? Icon(Icons.star_outline):Icon(Icons.star)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: IconButton(
                  onPressed: (){
                    //todo add tournament to bookmark
                    //TODO SCAN QR CODE
                  },
                  icon: Icon(Icons.zoom_in)
              ),
            )
          ],
          title: Text(
            widget.tournement.title.toString() + " tournament ",
            style: TextStyle(
                fontSize: appBarTitleSize
            ),
          ),
          centerTitle: true,
          backgroundColor: themeColor,
        ),
        body: FutureBuilder(
            future: fetchedUser,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if(snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 28),
                        child: Row(
                          children: [
                            Text(
                              "Organised by : ",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: Text(
                                  widget.tournement.owner!.fullName.toString(),
                                  style: TextStyle(
                                      fontSize: 24
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Verified",style: TextStyle(fontSize: 20,color: Colors.blue),
                            ),
                            SizedBox(width: 8,),
                            Icon(Icons.verified,color: Colors.blue,)
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "will take place in : ",
                        style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        widget.tournement.prize.toString(),
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: themeColor
                        ),
                      ),

                      StadiumCard(description: "Megrine", imageUrl: widget.tournement.place!.picture.toString()),
                      SizedBox(height: 10,),
                      Text(
                        "Available places : ",
                        style: TextStyle(
                            color: themeColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 4,),
                      widget.tournement.participants != null?
                      Text(
                        widget.tournement.participants!.length.toString() + ' /' + widget.tournement.numberOfParticipants!.toString(),
                        style: TextStyle(
                            color: themeColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        ),
                      ): Text(
                        '0 /' + widget.tournement.numberOfParticipants!.toString(),
                        style: TextStyle(
                            color: themeColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Inscription fee :"+widget.tournement.entriePrice.toString()+"dt for team",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0,top: 28),
                        child: Row(
                          children: [
                          Text(
                          "Status",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'ProductSans'
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 48.0),
                          child: Opacity(
                            opacity: 1,
                            child: Transform.rotate(
                              angle: 0.5,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.green,width: 4),
                                  ),
                                  child: Text(
                                    "Open",textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TournamentDrawScreen(tournement: widget.tournement)));
                              },
                              child: Container(
                                height: 45,
                                width: 160,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: themeColor),
                                child: Center(
                                  child: Text(
                                    "Check draw",
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if(team!="noteam")...[
                            Container(
                              child: InkWell(
                                onTap: () async {
                                  print(widget.tournement.id.toString()+"aaaaaaa"+team);
                                  var list=await TournamentService().addTeamToTournament(widget.tournement.id,team);
                                  print(list);


                                  if(list=="Team added") {
                                    PaymentCard card =
                                    PaymentCard('4242424242424242', '12', '2025');
                                    CheckoutPayment payment = CheckoutPayment();
                                    payment.makePayment(card, widget.tournement.entriePrice! *100);

                                    //todo generate qr

                                    showModalBottomSheet(
                                        context: context,
                                        builder:(context) => buildSheet("Match game","Scan this code to know your match game"));











                                    setState(() {
                                      payed = true;
                                    });


                                  }else if(list=="duplicated"){
                                    //TODO afficher alert
                                  }else {
                                    //TODO afficher probléme de connexion
                                  }
                                },
                                child: Container(
                                  height: 45,
                                  width: 160,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: payed ? Colors.grey.shade300 : themeColor),
                                  child: payed
                                      ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Done",
                                        style: TextStyle(
                                            color: themeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(
                                        Icons.done,
                                        color: themeColor,
                                      )
                                    ],
                                  ) : Center(
                                    child: Text(
                                      "Payment",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )],
                        ],
                      ),
                    ],
                  ),
                );

              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        )
    );
  }

  Widget buildSheet(String title,String description) => ListView(
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: themeColor),
          ),
        ),
      ),
      SizedBox(height: 15,),
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Text(description,style: TextStyle(
            color: Colors.grey,
            fontSize: 24,
            fontWeight: FontWeight.w600
        ),),
      ),
      Padding(
        padding: EdgeInsets.only(left: 12,right: 12,top:20),
        child: Container()
      )
    ],
  );


  /* Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated : onQRViewCreated,
  );

  void onQRViewCreated(QRViewController controller){

  } */


}