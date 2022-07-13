
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/User.dart';

import '../Model/News.dart';
import '../constants.dart';
import '../main.dart';

class RefereeService{

  final String _baseUrl = serverLocalhost+":3000";


  Future<String?> uploadFileReferee(String id, file,price,type) async {
    print(_baseUrl+"/file/"+id);
    var request = http.MultipartRequest('POST',Uri.http(_baseUrl,"/arbitre/file/"+id));
    SharedPreferences prefs = await SharedPreferences.getInstance();


    request.fields['price'] = price;
    request.fields['sport'] = type ;

    if (file != null) {

      request.files.add(await http.MultipartFile.fromPath('file', file));
    }
    print(request.fields);
    var response = await request.send();
    final responseData = await response.stream.toBytes();
    final  responseString= String.fromCharCodes(responseData);
    print(responseString.toString());
    Map<String, dynamic> user = await jsonDecode(responseString);
    if (response.statusCode == 201){
      // User u = User.fromJson(user['user']);
      //
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
      return await Future(() => "created");
    }else if (response.statusCode == 400){
      return await Future(() => "error");
    }
    return response.reasonPhrase;
  }





}