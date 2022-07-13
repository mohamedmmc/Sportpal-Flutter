import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'create_channel_view.dart';
import 'group_channel_view.dart';

class ChannelListView extends StatefulWidget {
  @override
  _ChannelListViewState createState() => _ChannelListViewState();
}

class _ChannelListViewState extends State<ChannelListView>

    with ChannelEventHandler {
  List<User?> adversaire =[];
  List<GroupChannel?> groupChanneladversaire =[];
  late String id;
  late Future<bool> fetchedUser;
  late SharedPreferences prefs;

  Future<void> getGroupChannels() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    try {
      final query = GroupChannelListQuery()
        ..includeEmptyChannel = true
        ..order = GroupChannelListOrder.latestLastMessage
        ..limit = 15;

      List<GroupChannel>? channels = await query.loadNext();
      groupChanneladversaire = channels;
      print(groupChanneladversaire);
      for(int i = 0; i<channels.length;i++) {
        for (int j = 0; j < channels[i].members.length; j++) {
          if (channels[i].members[j].userId != id) {
            setState(() {

              adversaire.add(channels[i].members[j]);
            });
          }
        }
      }


    } catch (e) {
      print('channel_list_view: getGroupChannel: ERROR: $e');

    }
  }

  @override
  void initState() {
    getGroupChannels();
    super.initState();
    SendbirdSdk().addChannelEventHandler('channel_list_view', this);
  }

  @override
  void dispose() {
    SendbirdSdk().removeChannelEventHandler("channel_list_view");
    super.dispose();
  }

  @override
  void onChannelChanged(BaseChannel channel) {
    setState(() {
      // Force the list future builder to rebuild.
    });
  }

  @override
  void onChannelDeleted(String channelUrl, ChannelType channelType) {
    setState(() {
      // Force the list future builder to rebuild.
    });
  }

  @override
  void onUserJoined(GroupChannel channel, User user) {
    setState(() {
      // Force the list future builder to rebuild.
    });
  }

  @override
  void onUserLeaved(GroupChannel channel, User user) {
    setState(() {
      // Force the list future builder to rebuild.
    });
    super.onUserLeaved(channel, user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigationBar(),
      body:body(context)
    );
  }

  AppBar navigationBar() {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      centerTitle: true,

      leading: BackButton(color: Theme.of(context).primaryColor),
      title: Text(
        'Channels',
        style: TextStyle(color: Colors.black),
      ),

    );
  }

  Widget body(BuildContext context) {
    return FutureBuilder(
      future: getGroupChannels(),
      builder: (context, snapshot) {


        if(adversaire.isNotEmpty && groupChanneladversaire.isNotEmpty){
        return ListView.builder(
            itemCount: groupChanneladversaire.length,
            itemBuilder: (context, index) {
              GroupChannel channel = groupChanneladversaire[index]!;
              return ListTile(


                // Display all channel members as the title
                title: Text(adversaire[index]!.nickname),
                leading: Image(image: true ? NetworkImage(adversaire[index]!.profileUrl!) : AssetImage('assets/images/footnews1.png') as ImageProvider,),
                // Display the last message presented
                subtitle: Text(channel.lastMessage?.message ?? ''),
                onTap: () {
                  gotoChannel(channel.channelUrl);
                },
              );
            });
      }
        else{
          return Container();
        }
        }

    );
  }

  void gotoChannel(String channelUrl) {
    GroupChannel.getChannel(channelUrl).then((channel) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GroupChannelView(groupChannel: channel),
        ),
      );
    }).catchError((e) {
      //handle error
      print('channel_list_view: gotoChannel: ERROR: $e');
    });
  }
}

