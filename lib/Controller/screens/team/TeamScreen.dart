import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sendbird_sdk/core/channel/group/group_channel.dart';
import 'package:sendbird_sdk/params/group_channel_params.dart';
import 'package:sendbird_sdk/query/user_list/user_list_query.dart';
import 'package:sportpal/Controller/authentification/test.dart';
import 'package:sportpal/Controller/screens/Foot/JoinFootballTeamsScreen.dart';
import 'package:sportpal/Controller/screens/Tennis/TennisPlayersTinder.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';
import 'package:sportpal/Controller/screens/profil/aboutMe/aboutMeScreen.dart';
import 'package:sportpal/Controller/screens/team/MatchHistory/ListMatchHistoryScreen.dart';
import 'package:sportpal/Controller/screens/team/createTeamScreen.dart';
import 'package:sendbird_sdk/core/models/user.dart' as usersb;
import 'package:sportpal/variables.dart';
import '../../../Model/Player.dart';
import '../../../Model/Team.dart';
import '../../../Model/User.dart';
import '../../../Service/TeamService.dart';
import '../../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Foot/ChallengeFootballTeamsScreen.dart';
import '../sendbird/group_channel_view.dart';
import 'joinTeamRequests.dart';


class FootBallTeam extends StatefulWidget {
  const FootBallTeam({Key? key}) : super(key: key);


  @override
  _FootBallTeamState createState() => _FootBallTeamState();
}

class Constants {
  static const String Requests = "Join requests";
  static const String Quit = "Leave team";
  static const String Cancel = "Cancel";
  static const List<String> choices = <String>[Requests, Quit, Cancel];
}

class _FootBallTeamState extends State<FootBallTeam> {

   late List<User?> playerList;
  late SharedPreferences prefs;

  late Team team ;
  late String id ;
  late Future<bool> fetchedTeams;

  Future<bool> fetchTeam() async {
    prefs = await SharedPreferences.getInstance();
     id = prefs.getString("_id")!;

    var test= await TeamService().myTeam(id);
    print("Ena test mta3 team wahda "+test.toString());

    team = test as Team;
    playerList = team.players.toList();
    setState(() {

    });
      return true;
  }
   Future<List<usersb.User>> getUsers() async {
     print(ApplicationUserListQuery().toString());
     try {
       final query = ApplicationUserListQuery();

       List<usersb.User> users = await query.loadNext();
       return users;
     } catch (e) {
       print('create_channel_view: getUsers: ERROR: $e');
       return [];
     }
   }

  @override
  void initState() {
    getUsers().then((users) {
      setState(() {
        _availableUsers.clear();
        _availableUsers.addAll(users);
      });
    }).catchError((e) {
      print('initState: ERROR: $e');
    });
    fetchedTeams = fetchTeam();
    super.initState();
  }
   final Set<usersb.User> _selectedUsers = {};
   final List<usersb.User> _availableUsers = [];
   Future<GroupChannel> createChannel(List<String> userIds) async {
     try {
       final params = GroupChannelParams()..userIds = userIds;
       params.isDistinct = true;
       final channel = await GroupChannel.createChannel(params);
       return channel;
     } catch (e) {
       print('createChannel: ERROR: $e');
       throw e;
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text(
          "My team",
          style: TextStyle(
              fontSize: appBarTitleSize, fontWeight: FontWeight.w600),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.users),
              iconSize: 18.0,
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JoinTeamRequests()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.check),
              iconSize: 18.0,
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JoinFootballTeamsScreen()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.facebookMessenger),
              iconSize: 16.0,
              color: Colors.white,
              onPressed: () {
                for(int i=0;i<_availableUsers.length;i++) {
                  for (int j = 0; j < team.players.length; j++) {
                    if (_availableUsers[i].userId == team.players[j]?.id) {
                      _selectedUsers.add(_availableUsers[i]);
                    }
                  }
                }
                createChannel(
                    [for (final user in _selectedUsers.toList()) user.userId])
                    .then((channel) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupChannelView(groupChannel: channel),
                    ),
                  );
                }).catchError((error) {
                  print(
                      'create_channel_view: navigationBar: createChannel: ERROR: $error');
                });

                //Navigator.push(context, MaterialPageRoute(builder: (context) => JoinFootballTeamsScreen()));

              },
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: fetchedTeams ,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if(snapshot.hasData) {

              return ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                  child :  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            _getAvatar(),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              team.name! +
                                "\nNumber of players : "+team.players.length.toString(),
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.bold),
                            ),

                            SizedBox(
                              width: 160,
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(FontAwesomeIcons.cog),
                              onSelected: choiceAction,
                              itemBuilder: (BuildContext context) {
                                return Constants.choices.map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => JoinTeamRequests()));
                                    },
                                  );
                                }).toList();
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:DataTable(
                          //border: TableBorder.all(),
                          columns: [
                            DataColumn(
                              label: Text("Picture"),
                            ),
                            DataColumn(label: Text("name")),
                            DataColumn(label: Text("Birth Date"), numeric: true),
                            DataColumn(label: Text("Post")),
                          ],
                            //Houni add DataRow
                          rows:
                          team.players.map<DataRow>((e) => DataRow(cells: [
                            DataCell(Image.network(
                              e!.profilePic!,
                              height: 50,
                              width: 50,

                            ),),
                            DataCell(Text(e.fullName.toString())),
                            DataCell(Text(e.birthDate.toString())),
                            DataCell(Text("Post")),
                          ])).toList()
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "History",
                            style: TextStyle(
                                color: themeColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(color: Colors.blue, width: 1.2),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/esprit.jpg"))),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "3 - 1 ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(color: Colors.blue, width: 1.2),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/Tekup.png"))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(color: Colors.blue, width: 1.2),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/esprit.jpg"))),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "2 - 1 ",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(color: Colors.blue, width: 1.2),
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/Sesame.png"))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ListMatchHistoryScreen()));
                            },
                            child: Text("Check more ",
                                style: TextStyle(fontWeight: FontWeight.w200)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengeFootballTeamsScreen()));

                          },
                          child: Container(
                            height: 60,
                            width: 320,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xff157519), Color(0xff5bb85f)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                                ),
                            child: Center(
                              child: Text(
                                "Challenge",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () async{
                              var test= await TeamService().leaveTeam(team.id,id);
                            },
                            child: Text("click here to leave the team",style: TextStyle(
                              color: Colors.blue[300],
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                            ),),
                          ),
                          SizedBox(width: 15,),
                          Icon(Icons.exit_to_app,size: 22,color: Colors.blue,)
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )
                );  },
              );
            }
            else {
              return const Center(
                child: Text("No Teams for this player"),
              );
            }
          }
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.blue, width: 1.2),
          image:
              DecorationImage(
                  image: NetworkImage(team.picture!),
                fit: BoxFit.fill
              )),
    );
  }

  void choiceAction(String choice) {
    print("Working");
  }
}
