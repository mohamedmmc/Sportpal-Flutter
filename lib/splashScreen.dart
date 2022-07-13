import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';
import 'package:sportpal/Controller/IntroPage.dart';
import 'package:sportpal/Controller/chooseCategory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/variables.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Future<bool> fetchedUser;
  late String route;
  late String id;

  Future<bool> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("email")) {


      id = prefs.getString("_id")!;
      try {
        final sendbird = SendbirdSdk(appId: "D05821D5-7D40-49E4-BC4C-B979DB317E94");
        final user = await sendbird.connect(prefs.getString("_id")!);

        print("sendbird : "+user.nickname);
      } catch (e) {
        print('login_view: connect: ERROR: $e');
        throw e;
      }
      route = "home2";
    } else {
      route = "signin";
    }


    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: fetchedUser,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (route == "home2") {
              return ChooseCategory();
            } else {
              return const Intropage();
            }
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
