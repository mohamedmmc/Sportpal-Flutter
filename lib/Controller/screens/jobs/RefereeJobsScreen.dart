import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';
import 'package:sportpal/Controller/screens/jobs/doneJobs.dart';
import 'package:sportpal/Controller/screens/jobs/jobRequests.dart';
import 'package:sportpal/Controller/screens/jobs/pendingJobs.dart';

import '../../../variables.dart';


class RefereeJobsScreen extends StatefulWidget {
  const RefereeJobsScreen({Key? key}) : super(key: key);

  @override
  _RefereeJobsScreenState createState() => _RefereeJobsScreenState();
}

class _RefereeJobsScreenState extends State<RefereeJobsScreen> {

  final screens =[
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Requests",),
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Done",),
    Tab(icon: Icon(FontAwesomeIcons.users),text: "Upcoming",),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: MenuWidget(),
          bottom: TabBar(
            tabs: [
              screens[0],
              screens[1],
              screens[2],
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [themeColor, Color(0xff3e5e6f)])
            ),
          ),
          title: Text(
            "Jobs",
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            JobRequests(),
            DoneJobs(),
            PendingJobs()
          ],
        ),
      ),
    );
  }
}
