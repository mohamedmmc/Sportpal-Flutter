import 'package:flutter/material.dart';

import 'jobModel/RefereeJob.dart';


class PendingJobs extends StatefulWidget {
  const PendingJobs({Key? key}) : super(key: key);

  @override
  _PendingJobsState createState() => _PendingJobsState();
}

class _PendingJobsState extends State<PendingJobs> {

  List<RefereeJob> jobs = RefereeJob.jobs;
  String data = "Victory";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(6),
        child: ListView.builder(
          itemCount: jobs.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            data = jobs[index].date.toString();
            return Container(
              height: 120,
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MatchHistoryFootDetails()));
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
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                image: DecorationImage(
                                    image:
                                    NetworkImage("${jobs[index].team1img}"))),
                          ),
                          Column(
                            children: [
                              Text(
                                jobs[index].location.toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "${jobs[index].team1} - ${jobs[index].team2}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
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
                                      jobs[index].date.toString(),style: TextStyle(
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
                                  fit: BoxFit.contain,

                                    image:
                                    NetworkImage("${jobs[index].team2img}"))),
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
}
