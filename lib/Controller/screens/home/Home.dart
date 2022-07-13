import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Controller/chooseCategory.dart';
import 'package:sportpal/Controller/screens/jobs/RefereeJobsScreen.dart';
import 'package:sportpal/Controller/screens/messenger/screens/select_user_screen.dart';
import 'package:sportpal/Controller/screens/onBoarding/ContactUs.dart';
import 'package:sportpal/Controller/screens/onBoarding/ReadTermsAndConditons.dart';
import 'package:sportpal/Controller/screens/profil/Settings/SettingsPage.dart';
import 'package:sportpal/variables.dart';
import '../../authentification/signIn.dart';
import '../Friends/friendsScreen.dart';
import '../Tennis/CardProvider.dart';
import '../news/newsPage.dart';
import '../sendbird/ChannelListView.dart';
import '../wallet/Payment_detail.dart';
import 'MenuPage.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  MenuItem currentItem = MenuItems.Home;
  SharedPreferences? prefs;
  Future<bool> fetchPrefs() async {
    if(genderFilter.isNotEmpty || type.isNotEmpty || age !=null ){
      final provider = Provider.of<CardProvider>(context,listen: false);
      provider.resetUsers();
    }
    prefs = await SharedPreferences.getInstance();
    return true;
  }
  @override
  void initState() {
    fetchPrefs();
    super.initState();
  }
  @override
  Widget build(BuildContext context) => ZoomDrawer(
      style: DrawerStyle.Style1,
      showShadow: true,
      shadowLayer1Color: Colors.blue,
      shadowLayer2Color: Colors.orange,
      borderRadius: 40,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
                ZoomDrawer.of(context)!.close();
              });
            }),
      ));

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.Home:
        return NewsPageScreen();
      case MenuItems.jobs:
        return RefereeJobsScreen();
      case MenuItems.messanger:
        return SelectUserScreen();
      case MenuItems.sendbird:
        return ChannelListView();
      case MenuItems.Team:
        return FriendsScreen();
      case MenuItems.payment:
        return Payment_detail();
      case MenuItems.sport:
        setState(() {
          themeColor;
        });
        return ChooseCategory();
      case MenuItems.ContactUs:
        return ContactUsScreen();
      case MenuItems.TermsAndConditions:
        return ReadTermsAndConditions();
      case MenuItems.Settings:
        return SettingsPage();
      case MenuItems.Logout:
        prefs?.remove("_id");
        prefs?.remove("birthDate");
        prefs?.remove("password");
        prefs?.remove("telNum");
        prefs?.remove("isVerified");
        prefs?.remove("gender");
        prefs?.remove("type");
        prefs?.remove("email");
        prefs?.remove("fullName");
        prefs?.remove("token");
        prefs?.remove("address");
        return SignIn();
      default:
        return NewsPageScreen();
    }
  }
}
