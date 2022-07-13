import 'package:flutter/material.dart';
import 'package:sportpal/Controller/screens/team/MatchHistory/MatchHistoryDetail.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';

import 'modelData/TeamsMatchHistory.dart';

class ListMatchHistoryScreen extends StatefulWidget {
  const ListMatchHistoryScreen({Key? key}) : super(key: key);

  @override
  _ListMatchHistoryScreenState createState() => _ListMatchHistoryScreenState();
}

class _ListMatchHistoryScreenState extends State<ListMatchHistoryScreen> {
  List<PastBets> pastbet = PastBets.mybets;
  String data = "Victory";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
            "Match History",
          style: TextStyle(
            fontSize: appBarTitleSize
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(6),
        child: ListView.builder(
          itemCount: pastbet.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            data = pastbet[index].result;
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MatchHistoryFootDetails()));
                },
                splashColor: Colors.blue[200],
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: changeColor(), width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                image: DecorationImage(
                                    image:
                                        NetworkImage("${pastbet[index].imgt1}"))),
                          ),
                          Column(
                            children: [
                              Text(
                                "18 mars 2022",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${pastbet[index].t1goals} - ${pastbet[index].t2goals}",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: changeColor(),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 3,
                                  ),
                                  child: Text(
                                    data,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: changeColor(), width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                image: DecorationImage(
                                    image:
                                    NetworkImage("${pastbet[index].imgt2}"))),
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
      ),
    );
  }

   changeColor() {
    if(data == "Victory"){
      return Colors.green[700];
    }else if (data == "Tie"){
      return Colors.grey;
    }else {
      return Colors.red;
    }
  }

}
