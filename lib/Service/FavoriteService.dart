import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/Matche.dart';
import 'package:sportpal/Model/User.dart';

import '../Model/Notification.dart';
import '../Model/Player.dart';
import '../constants.dart';
import '../variables.dart';

class FavoriteService {

  final String _baseUrl = serverLocalhost + ":3000";


  Future<List<Player>?> getFavs(String idUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    List<Player> notifications = [];


    final test = await http.get(
        Uri.http(_baseUrl, "/favorites/" + idUser), headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 404) {

      }
      else if (response.statusCode == 200) {
        List<dynamic> userData = await json.decode(response.body);

        print(userData);

        List<Matche> users = [];
        // print(userData.length); //=3

        for (int i = 0; i < userData.length; i++) {
          var list = userData as List;


          List<Player> players = list.map((x) => Player.fromJson(x)).toList();
          notifications = players;

          //notifications.add(list);
          print(players.toString());
        }

        return notifications;
      }
      else if (response.statusCode == 401) {
        return notifications;
      }
    }
    );
    return notifications;
  }

  Future<String?> delFavs(String idFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    List<Player> notifications = [];


    final test = await http.delete(
        Uri.http(_baseUrl, "/favorites/" + idFav), headers: headers)
        .then((http.Response response) async {
      print(response.body);
      if (response.statusCode == 404) {

      }
      else if (response.statusCode == 200) {
        return await Future(() => "good");
      }
    }
    );
    return test;
  }

  Future<String?> addFavorites(String match, String tournament, String userID,
      String adversaire) async {
    Map<String, dynamic> body;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    if (match.isNotEmpty) {
      body = {
        "match": match,
        "adversaire": adversaire
      };
    } else {
      body = {
        "tournament": tournament,
        "adversaire": adversaire
      };
    }


    print(body);

    final test = await http.post(
        Uri.http(_baseUrl, "/favorites/" + userID), headers: headers,
        body: json.encode(body))
        .then((http.Response response) async {
      if (response.statusCode == 201) {
        return await Future(() => "added to fav");
      } else if (response.statusCode == 403) {
        return await Future(() => "duplicate");
      }
      else if (response.statusCode == 500) {
        return await Future(() => "errorServer");
      }
    }
    );
    return test;
  }

}