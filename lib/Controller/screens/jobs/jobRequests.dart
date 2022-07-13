import 'package:flutter/material.dart';
import 'package:sportpal/variables.dart';

import 'jobModel/RefereeJob.dart';

class JobRequests extends StatefulWidget {
  const JobRequests({Key? key}) : super(key: key);

  @override
  _JobRequestsState createState() => _JobRequestsState();
}

class _JobRequestsState extends State<JobRequests> {

  final listKey = GlobalKey<AnimatedListState>();
  List<RefereeJob> jobs = RefereeJob.jobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: listKey,
        initialItemCount: jobs.length,
        itemBuilder: (context,index,animation){
          return ListItemWidget(
              item: jobs[index],
              animation: animation,
              onClicked: () {
                removeItem(index);
              });
        },

      ),
    );
  }
  void removeItem(int index) {
    final removedItem = jobs[index];
    jobs.removeAt(index);
    listKey.currentState!.removeItem(
        index,
            (context, animation) => ListItemWidget(
          item: removedItem,
          animation: animation,
          onClicked: () {
            //todo remove from sharedpref
          },
        ),
        duration: Duration(milliseconds: 600));
  }

}
class ListItemWidget extends StatelessWidget {
  final RefereeJob item;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListItemWidget(
      {Key? key,
        required this.item,
        required this.animation,
        required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: buildItem(),
      key: ValueKey(item.team1),
    );
  }

  Widget buildItem() {
    return Container(
      height: 170,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),

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
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${item.team1img}"))),
                ),
                Column(
                  children: [
                    Text(
                      item.location.toString(),
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "${item.team1} - ${item.team2}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          child: Text(
                            item.date.toString(),style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              "${item.team2img}"))),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onClicked,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: selectedSport == "foot" ? [Color(0xff126415), Color(0xff5bb85f)] : [Color(0xff379a3c), Color(0xff3eda43)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),),
                      child: Text("Accept",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400))),
                ),
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: onClicked,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: selectedSport == "foot" ? [Color(0xffd21919), Color(0xffe02b2b)] : [Color(0xffdf1b0c), Color(0xffdd6e6e)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),),
                      child: Text(
                        "Refuse",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}