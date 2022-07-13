import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/User.dart';

import '../Model/Notification.dart';
import '../Model/Player.dart';
import '../constants.dart';
import '../variables.dart';

class NotificationService{

  final String _baseUrl = serverLocalhost+":3000";


  Future<List<Notification>?> getNotifications(String idUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final List<Notification> notifications = [];


    final test = await http.get(Uri.http(_baseUrl, "/notification/"+idUser), headers: headers)
        .then((http.Response response) async {
      if(response.statusCode == 404){

      }
      else if(response.statusCode == 200) {

        List<dynamic> userData = await  json.decode(response.body);
        List<User> users = [];
        // print(userData.length); //=3
        for(int i = 0; i < userData.length; i++) {
          var list = userData[i]['to']as List;
          //print("holle"+list.runtimeType.toString());
          List<Player> imagesList = list.map((x) => Player.fromJson(x)).toList();

          Player player = Player.fromJson(userData[i]['from']);

          notifications.add(Notification(userData[i]['_id'],player,imagesList,userData[i]['description'],
              userData[i]['date'],userData[i]['sent'],userData[i]['accept'],userData[i]['typeNotification'],userData[i]['terrain']));

        }
        return notifications;
      }
      else if(response.statusCode == 401) {
        return notifications;
      }
    }
    );
    return notifications;

  }

  Future<String?> friendRequest(String from,String to) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    Map<String, dynamic> body = {
      "from": from,
      "to": to,
    };

    final test = await http.post(Uri.http(_baseUrl, "/notification/friend-request"), headers: headers,body: json.encode(body))
        .then((http.Response response) async {
      if(response.statusCode == 401){
        return await Future(() => "duplicate");
      }
      else if(response.statusCode == 201) {

        return await Future(() => "sent");
      }
      else if(response.statusCode == 400) {
        return await Future(() => "errorServer");
      }
    }
    );
    return test;

  }

  Future<String?> joinRequest(String from,String to) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    Map<String, dynamic> body = {
      "from": from,
      "to": to,
    };

    final test = await http.post(Uri.http(_baseUrl, "/notification/join-request"), headers: headers,body: json.encode(body))
        .then((http.Response response) async {
      if(response.statusCode == 401){
        return await Future(() => "duplicate");
      }
      else if(response.statusCode == 201) {

        return await Future(() => "sent");
      }
      else if(response.statusCode == 400) {
        return await Future(() => "errorServer");
      }
    }
    );
    return test;

  }

  Future<String?> matchRequest(String from,String to) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    Map<String, dynamic> body = {
      "from": from,
      "to": to,
      "terrain": Stadium,
    };
    print(body);

    final test = await http.post(Uri.http(_baseUrl, "/notification/match-request"), headers: headers,body: json.encode(body))
        .then((http.Response response) async {
          print(response.body.toString());
      if(response.statusCode == 401){
        return await Future(() => "duplicate");
      }
      else if(response.statusCode == 201) {

        return await Future(() => "sent");
      }
      else if(response.statusCode == 400) {
        return await Future(() => "errorServer");
      }
    }
    );
    return test;

  }

  Future<String?> deleteMYnotif(String from,String to) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    Map<String, dynamic> body = {
      "from": from,
      "to": to,
    };

print(body);
    final test = await http.delete(Uri.http(_baseUrl, "/notification/deleteMYnotif"), headers: headers,body: json.encode(body))
        .then((http.Response response) async {
      if(response.statusCode == 200) {

        return await Future(() => "notifDeleted");
      }
      else if(response.statusCode == 500) {
        return await Future(() => "errorServer");
      }
    }
    );
    return test;

  }

  Future<String?> confirmNotif(String from,String to) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    Map<String, dynamic> body = {

      "from": from,
      "to": to,

    };

    print(body);
    final test = await http.post(Uri.http(_baseUrl, "/notification/confirm"), headers: headers,body: json.encode(body))
        .then((http.Response response) async {

          print(response.body.toString());
      if(response.statusCode == 201) {
        return await Future(() => "friendRequestAcepted");
      }

      else if(response.statusCode == 500) {
        return await Future(() => "errorServer");
      }
    }
    );
    return test;
  }

  Future<String?> confirmNotifJoin(String from,String to) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    Map<String, dynamic> body = {
      "from": from,
      "to": to,
    };

    print(body);
    final test = await http.post(Uri.http(_baseUrl, "/notification/confirm-join"), headers: headers,body: json.encode(body))
        .then((http.Response response) async {
      if(response.statusCode == 201) {

        return await Future(() => "Join Request Accepted");
      }
      else if(response.statusCode == 500) {
        return await Future(() => "errorServer");
      }
    }
    );
    return test;

  }

}