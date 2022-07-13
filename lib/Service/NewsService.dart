
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/User.dart';

import '../Model/News.dart';
import '../constants.dart';
import '../main.dart';

class NewsService{

  final String _baseUrl = serverLocalhost+":3000";


  Future <bool> getNews(  List <News> listNews) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final List<News> _news = [];
    final test = await http.get(Uri.http(_baseUrl, "/news"), headers: headers)
        .then((http.Response response) async {

      List<dynamic> newsData = await  json.decode(response.body);

      for(int i = 0; i < newsData.length; i++) {
        //Map<String, dynamic> userData = newsData[i];
        //print(await newsData[i]["imageURL"]);
        if(newsData[i]["imageURL"] != null || newsData[i]["title"] != null){

          listNews.add(News(newsData[i]["_id"], newsData[i]["imageURL"], newsData[i]["title"],  newsData[i]["desc"],newsData[i]["type"]));

        }
      }
      if(response.statusCode == 200) {

        return await new Future(() => _news);
      }});
    return true;

  }
  Future <bool> getNewsSport(  List <News> listNews,String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final List<News> _news = [];
    final test = await http.get(Uri.http(_baseUrl, "/news/"+type), headers: headers)
        .then((http.Response response) async {

      List<dynamic> newsData = await  json.decode(response.body);


      for(int i = 0; i < newsData.length; i++) {
        //Map<String, dynamic> userData = newsData[i];
        //print(await newsData[i]["imageURL"]);
        if(newsData[i]["imageURL"] != null || newsData[i]["title"] != null){

          listNews.add(News(newsData[i]["_id"], newsData[i]["imageURL"], newsData[i]["title"],  newsData[i]["desc"],newsData[i]["type"]));
        }
      }
      if(response.statusCode == 200) {

        return await new Future(() => _news);
      }});
    return true;

  }




}