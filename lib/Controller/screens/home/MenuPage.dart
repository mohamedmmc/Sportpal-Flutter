import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/variables.dart';




class MenuItem{
  final String title;
  final IconData icon;
  const MenuItem(this.title,this.icon);
}

class MenuItems{
  static const Home = MenuItem("Home", Icons.account_box_outlined);
  static const jobs = MenuItem("Jobs", Icons.wallet_travel);
  static const messanger = MenuItem("Messanger", Icons.message);
  static const sendbird = MenuItem("Sendbird", Icons.message);
  static const Team = MenuItem("Friends", FontAwesomeIcons.users);
  static const sport = MenuItem("Change sport", Icons.sports_baseball);
  static const payment = MenuItem("Payment", Icons.payment);
  static const ContactUs = MenuItem("Contact us", FontAwesomeIcons.users);
  static const TermsAndConditions = MenuItem("Terms of Service", Icons.article_outlined);


  static const Settings = MenuItem("Settings", Icons.settings);
  static const Logout = MenuItem("Log out", Icons.logout);





  static const all = <MenuItem>[
    Home,jobs,messanger,sendbird,Team,payment,sport,ContactUs,TermsAndConditions
  ];

}

class MenuPage extends StatefulWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({Key? key, required this.currentItem, required this.onSelectedItem}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Future<bool> fetchedUser;
  late String fullname;
  late String profilPic;
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();

    fullname = prefs.getString("fullName")!;
    profilPic = prefs.getString("profilePic")!;

    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: FutureBuilder(
          future: fetchedUser,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      ...MenuItems.all.map(buildMenuItem).toList(),
                      Divider(color: Colors.white70,),
                      SizedBox(height: 40,),
                      Spacer(flex: 1,),
                      ListTile(
                        selectedTileColor: Colors.black26,
                        selected: widget.currentItem == MenuItems.Settings,
                        minLeadingWidth: 20,
                        leading: Icon(MenuItems.Settings.icon),
                        title: Text(MenuItems.Settings.title),
                        onTap: () {
                          widget.onSelectedItem(MenuItems.Settings);
                        },
                      ),
                      ListTile(
                        selectedTileColor: Colors.black26,
                        selected: widget.currentItem == MenuItems.Logout,
                        minLeadingWidth: 20,
                        leading: Icon(MenuItems.Logout.icon),
                        title: Text(MenuItems.Logout.title),
                        onTap: () {
                          widget.onSelectedItem(MenuItems.Logout);
                        },
                      ),


                    ],
                  ),
                ),
              );
            } else {
              return const Center(

                child: CircularProgressIndicator(),
              );
            }
          }
        )

      ),
    );
  }

  buildHeader(BuildContext context)=>Container(
    color: Colors.blue,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 52,
          backgroundImage: true ? NetworkImage(profilPic) : AssetImage('assets/images/footnews1.png') as ImageProvider,
        ),
        SizedBox(height: 12,),
        Text(
          "Seif az"
        )
      ],
    ),
  );

  buildMenuItem(MenuItem item) {
    return ListTileTheme(
      child: ListTile(
        selectedTileColor: Colors.black26,
        selected: widget.currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: () {
          widget.onSelectedItem(item);
        },
      ),
    );
  }
}
