
import 'dart:core';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/Complexe.dart';
import 'package:sportpal/Model/Terrain.dart';
import 'package:sportpal/Model/User.dart';

import '../Model/News.dart';
import '../constants.dart';
import '../main.dart';

class ComplexeService{

  final String _baseUrl = serverLocalhost+":3000";


  Future <bool> getComplexes(  List <Complexe> listComplexe) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final List<Complexe> _complexe = [];
     List<Complexe> terrain = [];

    final test = await http.get(Uri.http(_baseUrl, "/complexe"), headers: headers)
        .then((http.Response response) async {
         // print("ena body"+response.body);
      List<dynamic> complexeData = await  json.decode(response.body);

      for(int i = 0; i < complexeData.length; i++) {
        //Map<String, dynamic> userData = newsData[i];
        //print(await newsData[i]["imageURL"]);
        var list = complexeData[i]['terrains']as List;
        print(list.length);
        //print("holle"+list.runtimeType.toString());

        List<Terrain> terrainList = list.map((x) => Terrain.fromJson(x)).toList();
        print(terrainList);
        listComplexe.add(Complexe(complexeData[i]["_id"], complexeData[i]["owner"], terrainList,  complexeData[i]["address"],complexeData[i]["name"],complexeData[i]["picture"]));

      }
      if(response.statusCode == 200) {

        return await new Future(() => listComplexe);
      }});
    return true;

  }






  // Future <bool> getNewsSport(  List <News> listNews,String type) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Map<String, String> headers = {
  //     "Content-Type": "application/json; charset=UTF-8"
  //   };
  //   final List<News> _news = [];
  //   final test = await http.get(Uri.http(_baseUrl, "/news/"+type), headers: headers)
  //       .then((http.Response response) async {
  //
  //     List<dynamic> newsData = await  json.decode(response.body);
  //
  //
  //     for(int i = 0; i < newsData.length; i++) {
  //       //Map<String, dynamic> userData = newsData[i];
  //       //print(await newsData[i]["imageURL"]);
  //       if(newsData[i]["imageURL"] != null || newsData[i]["title"] != null){
  //
  //         listNews.add(News(newsData[i]["_id"], newsData[i]["imageURL"], newsData[i]["title"],  newsData[i]["desc"],newsData[i]["type"]));
  //       }
  //     }
  //     if(response.statusCode == 200) {
  //
  //       return await new Future(() => _news);
  //     }});
  //   return true;
  //
  // }




}