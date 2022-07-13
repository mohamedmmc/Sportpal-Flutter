import 'package:flutter/material.dart';

import '../../../../Model/News.dart';
import '../../../../Service/NewsService.dart';
import '../widgets/secondaryCard.dart';
import 'ReadNewsView.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RecentNewsScreen extends StatefulWidget {
  const RecentNewsScreen({Key? key}) : super(key: key);

  @override
  _RecentNewsScreenState createState() => _RecentNewsScreenState();
}

class _RecentNewsScreenState extends State<RecentNewsScreen> {
  late String type;
  late SharedPreferences prefs;

  final List<News> news = [];
  late Future<bool> fetchedNews;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    type = prefs.getString("type")!;
    await NewsService().getNews(news);
    setState(() {

    });
    return true;
  }



  @override
  void initState() {
    fetchedNews = fetchUser();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var recent = news[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadNewsView(news: recent),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 135.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: SecondaryCard(news: recent),
          ),
        );
      },
    );
  }
}
