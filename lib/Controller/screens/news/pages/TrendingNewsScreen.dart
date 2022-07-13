import 'package:flutter/material.dart';

import '../../../../Model/News.dart';
import '../../../../Service/NewsService.dart';
import '../widgets/primaryCard.dart';
import 'ReadNewsView.dart';
import 'package:shared_preferences/shared_preferences.dart';



class TrendingNewsScreen extends StatefulWidget {
  const TrendingNewsScreen({Key? key}) : super(key: key);

  @override
  _TrendingNewsScreenState createState() => _TrendingNewsScreenState();
}

class _TrendingNewsScreenState extends State<TrendingNewsScreen> {
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
      itemCount: news.take(4).length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var trending = news[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReadNewsView(news: trending),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 300.0,
            margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: PrimaryCard(news: trending),
          ),
        );
      },
    );
  }
}
