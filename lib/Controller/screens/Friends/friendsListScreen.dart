import 'package:flutter/material.dart';
import 'package:sendbird_sdk/constant/enums.dart';
import 'package:sendbird_sdk/core/channel/group/group_channel.dart';
import 'package:sendbird_sdk/params/group_channel_params.dart';
import 'package:sendbird_sdk/query/channel_list/group_channel_list_query.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Model/Notification.dart' as notif;
import 'package:sportpal/Service/PlayerService.dart';

import '../../../Model/Player.dart';
import '../../../Service/NotificationService.dart';
import '../Messanger/ChatScreen.dart';
import '../sendbird/ChannelListView.dart';
import '../sendbird/group_channel_view.dart';
class FriendsListScreen extends StatefulWidget {
  const FriendsListScreen({Key? key}) : super(key: key);

  @override
  _FriendsListScreenState createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  final listKey = GlobalKey<AnimatedListState>();

  late Future<bool> fetchedUser;
  late String id;
  late List<Player>? playerInvitation;
  final List<Player> news = [];
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;

    var test = await PlayerService().getFriends(id);
    print(test);
    test?.forEach((element) {
      //   if(element.accept){
      //     if(element.type! == "Friend request"){
      //       if(id==element.from!.id){
      //         playerInvitation!.add(element.to[0]!) ;
      //       }else{
      //         playerInvitation!.add(element.from!);
      //       }
      news.add(element);
      //     }
      //
      //   }
    });

    setState(() {

    });

    return true;
  }

  @override
  void initState() {
    fetchedUser= fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchedUser ,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if(snapshot.hasData) {
                return AnimatedList(
                  key: listKey,
                  initialItemCount: news.length,
                  itemBuilder: (context, index, animation) {

                    return ListItemWidget(
                        item: news[index],
                        animation: animation,
                        onClicked: () {

                        });
                  },);
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }})
    );}

  void removeItem(int index) {
    final removedItem = news[index];
    news.removeAt(index);
    listKey.currentState!.removeItem(
        index,
            (context, animation) => ListItemWidget(
          item: removedItem,
          animation: animation,
          onClicked: () {
          },
        ),
        duration: Duration(milliseconds: 600));
  }
}

class ListItemWidget extends StatefulWidget {
  final Player item;
  final Animation<double> animation;
  final VoidCallback? onClicked;



  const ListItemWidget(
      {Key? key,
        required this.item,
        required this.animation,
        required this.onClicked})
      : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {

  Future<List<GroupChannel>> getGroupChannels() async {
    try {
      final query = GroupChannelListQuery()
        ..includeEmptyChannel = true
        ..order = GroupChannelListOrder.latestLastMessage
        ..limit = 15;
      return await query.loadNext();
    } catch (e) {
      print('channel_list_view: getGroupChannel: ERROR: $e');
      return [];
    }
  }
  final Set<User> _selectedUsers = {};
  final List<User> _availableUsers = [];

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
  Future<List<User>> getUsers() async {
    print(ApplicationUserListQuery().toString());
    try {
      final query = ApplicationUserListQuery();

      List<User> users = await query.loadNext();
      return users;
    } catch (e) {
      print('create_channel_view: getUsers: ERROR: $e');
      return [];
    }
  }
  @override
  void initState() {
    super.initState();
    getUsers().then((users) {
      setState(() {
        _availableUsers.clear();
        _availableUsers.addAll(users);
      });
    }).catchError((e) {
      print('initState: ERROR: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: FutureBuilder(
          future: getGroupChannels(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false || snapshot.data == null) {
              // Nothing to display yet - good place for a loading indicator
              return Container();
            }
            List<GroupChannel>? channels = snapshot.data as List<GroupChannel>?;
            return ListTile(
              onTap: () {
                for(int i=0;i<_availableUsers.length;i++){
                  if (_availableUsers[i].userId == widget.item.id){
                    _selectedUsers.add(_availableUsers[i]);
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
                  }
                }


              },
              leading: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(widget.item.profilePic!),
              ),
              title: Text(
                widget.item.fullName!,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                widget.item.birthDate.toString(),
                style: TextStyle(fontSize: 12),
              ),
              contentPadding: EdgeInsets.all(16),
            );
          },
        )
    );
  }
}
