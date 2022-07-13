import 'package:flutter/material.dart';

import '../../../../Model/News.dart';
import '../../../../Service/NewsService.dart';
import '../../../../constants.dart';
import '../widgets/primaryCard.dart';
import '../widgets/secondaryCard.dart';
import 'ReadNewsView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopularTabView extends StatefulWidget {
  @override
  State<PopularTabView> createState() => _PopularTabViewState();
}

class _PopularTabViewState extends State<PopularTabView> {

  late String type;
  late SharedPreferences prefs;

  final List<News> news = [];
  late Future<bool> fetchedNews;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    type = prefs.getString("type")!;
    await NewsService().getNewsSport(news,type);
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
    return Container(
      child: FutureBuilder(
        future: fetchedNews ,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData) {
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 300.0,
                  padding: EdgeInsets.only(left: 18.0),
                  child: ListView.builder(
                    itemCount: news.take(4).length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var newss = news[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReadNewsView(news: newss)));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 12.0),
                          child: PrimaryCard(news: newss),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 25.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 19.0),
                    child: Text("BASED ON YOUR READING HISTORY",
                        style: kNonActiveTabStyle),
                  ),
                ),
                ListView.builder(

                  itemCount: news.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
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
                        height: 160.0,
                        margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                        child: SecondaryCard(news: recent),
                      ),
                    );
                  },
                )
              ],
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}