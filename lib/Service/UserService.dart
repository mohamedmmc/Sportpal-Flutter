import 'package:http/http.dart' as http;
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/User.dart';
import 'package:sportpal/variables.dart';

import '../Model/Player.dart';
import '../constants.dart';

class UserService{

  final String _baseUrl = serverLocalhost+":3000";
  Future<dynamic> createAccounSendBird(String user_id,String nickname,String profile_url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userData = {
      "user_id": user_id,
      "nickname": nickname,
      "profile_url": profile_url,
    };
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Api-Token":"0ea2dd200060b6093df394711a94824bbafbe6ae"
    };
    final test = await http.post(Uri.parse("https://api-D05821D5-7D40-49E4-BC4C-B979DB317E94.sendbird.com/v3/users"), headers: headers, body: json.encode(userData))
        .then((http.Response response) async {
      print(response.body);
      if(response.statusCode == 200) {
        try {
          final sendbird = SendbirdSdk(appId: "D05821D5-7D40-49E4-BC4C-B979DB317E94");
          final user = await sendbird.connect(prefs.getString("_id")!);

          print("sendbird : "+user.nickname);
        } catch (e) {
          print('login_view: connect: ERROR: $e');
          throw e;
        }
        return await Future(() =>'response');
      }
      else if(response.statusCode == 203) {
        print(response.body);
        return await Future(() => "good");
      }
    }

    );
    return test!;

  }


  Future<String?> CreateAccount(firstname,email,password,telnum,gender,type,String? filepath,birthdate,post) async {
    var route = "";
    if(post == "referee"){
      route = "arbitre";
    }else  if(post == "player"){
      route = "player";
    }else  if(post == "complexe"){
      route = "complexeowner";
    }
    var request = http.MultipartRequest('POST',Uri.http(_baseUrl,"/"+route));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (password.toString().isNotEmpty) {
      request.fields['password'] = password;
      request.fields['telNum'] = telnum;
      request.fields['gender'] = gender;
      request.fields['birthDate'] = birthdate;
    }
    request.fields['fullName'] = firstname;
    request.fields['email'] =email ;

    if (filepath != null) {
      request.files.add(await http.MultipartFile.fromPath('picture', filepath));
    }
    print(request.fields);
    var response = await request.send();
    final responseData = await response.stream.toBytes();
    final responseString = String.fromCharCodes(responseData);
    Map<String, dynamic> user = await jsonDecode(responseString);
    if (response.statusCode == 201){


      User u = User.fromJson(user['user']);
      prefs.setString("_id", u.id!);
      //prefs.setString("team", u.!);
      prefs.setString("fullName", u.fullName!);
      prefs.setString("email", u.email!);
      prefs.setString("type", u.type!);
      prefs.setString("profilePic", u.profilePic!);
      if(u.telNum != null){
        prefs.setString("telNum", u.telNum!);

      }if(u.birthDate !=null){
        prefs.setString("birthDate", u.birthDate!);
      }

      prefs.setString("friends", u.friends!.length.toString());
      //prefs.setString("address", u.email!);
      prefs.setBool("isVerified", u.isVerified!);
      // Map<String,dynamic> test = u.toMap();
      // print(test);
      // test.forEach((key, value) {
      //   print(key);
      //   print(value);
      //   if(value == false || value == true){
      //
      //     prefs.setBool(key, value);
      //   }else if (value is List){
      //     value.forEach((element) {
      //       prefs.setString("longtitude", element);
      //       prefs.setString("laltitude", element);
      //     });
      //   }else if (value != null){
      //
      //     prefs.setString(key, value);
      //   }else{
      //     prefs.setString(key, "");
      //   }
      // });
      await createAccounSendBird(prefs.getString("_id")!, prefs.getString("fullName")!, prefs.getString("profilePic")!);

      return await Future(() => prefs.getString("_id"));
    }else if (response.statusCode == 401){
      return await Future(() => "duplicated");
    }
    return response.reasonPhrase;
  }

  Future<String> login(Map<String,dynamic> user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/login"), headers: headers, body: json.encode(user))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      if(response.statusCode == 200) {
        prefs.setString("token", userData["token"]);
        Player u = Player.fromJson(userData["user"]);

        // print("mes amies : "+u.friends!.length.toString());
        prefs.setString("_id", u.id!);
        //prefs.setString("team", u.!);
        prefs.setString("fullName", u.fullName!);
        prefs.setString("email", u.email!);
        prefs.setString("type", u.type!);

        prefs.setString("profilePic", u.profilePic!);
        prefs.setString("friends", u.friends!.length.toString());
        //prefs.setString("address", u.email!);
        prefs.setBool("isVerified", u.isVerified!);
        if(u.team!.isNotEmpty){
          for(int i=0;i<u.team!.length;i++){

            prefs.setString("team"+i.toString(), u.team![i]);
            print(prefs.getString("team"+i.toString()));
          }
        }
        try {
          final sendbird = SendbirdSdk(appId: "D05821D5-7D40-49E4-BC4C-B979DB317E94");
          final user = await sendbird.connect(prefs.getString("_id")!);

          print("sendbird : "+user.nickname);
        } catch (e) {
          print('login_view: connect: ERROR: $e');
          throw e;
        }
        if(u.team!.isNotEmpty){
          for(int i=0;i<u.team!.length;i++){
            prefs.setString("team"+i.toString(), u.team![i]);
            print(prefs.getString("team"+i.toString()));
          }
        }

        Map<String,dynamic> test = u.toMap();

        return await Future(() => "good");
      }
      else if(response.statusCode == 401) {
        print(response.body);
        return await Future(() => "pass");
      }else if(response.statusCode == 404) {
        print(response.body);
        return await Future(() => "mail");
      }

    }

    );
    return test!;

  }

  Future<dynamic> CheckMail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userData = {
      "email": email
    };
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/checkMail"), headers: headers, body: json.encode(userData))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      print(response.body);
      if(response.statusCode == 200) {

        User u = User.fromJson(userData["reponse"]);
        Map<String,dynamic> test = u.toMap();
        test.forEach((key, value) {
          if(value == false || value == true){
            prefs.setBool(key, value);
          }else if (value is List){
            value.forEach((element) {
              prefs.setString("longtitude", element);
              prefs.setString("laltitude", element);
            });
          }else if (value != null){
            prefs.setString(key, value);
          }else{
            prefs.setString(key, "");
          }
        });
        return await Future(() => "exist");
      }
      else if(response.statusCode == 203) {
        print(response.body);
        return await Future(() => "good");
      }
    }

    );
    return test!;

  }

  Future<String> forgotPass(Map<String,String> email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/forgotPassword"), headers: headers, body: json.encode(email))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      if(response.statusCode == 200) {
        return await new Future(() => userData["token"]);
      }
      else if(response.statusCode == 403)
        return await new Future(() => userData["token"]);
      else
        return await new Future(() => "no user");
    });
    return test;

  }

  Future<String?> ResetPassword(Map<String,String> pass,String email,String token) async {

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };
    final test = await http.post(Uri.http(_baseUrl, "/user/resetPassword/"+email+"/"+token), headers: headers, body: json.encode(pass))
        .then((http.Response response) async {
      Map<String, dynamic> userData = await  json.decode(response.body);
      if(response.statusCode == 200) {

        return await Future(() => "modified");
      }
      else if(response.statusCode == 400) {
        return await  Future(() => "token expired");
      } else if(response.statusCode == 401) {
        return await  Future(() => "no user");
      }
    });

    return  test;

  }


}