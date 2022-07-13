import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/Player.dart';
import '../../../Service/PlayerService.dart';
import '../../../constants.dart';
import '../Match/CreateMatch.dart';
class GroupChannelView extends StatefulWidget {
  final GroupChannel groupChannel;
  const GroupChannelView({Key? key, required this.groupChannel}) : super(key: key);

  @override
  _GroupChannelViewState createState() => _GroupChannelViewState();
}

class _GroupChannelViewState extends State<GroupChannelView>
    with ChannelEventHandler {
  List<BaseMessage> _messages = [];
   late User? adversaireSB;
   late Player? adversaire;
  late String id;
  late Future<bool> fetchedUser;

  late SharedPreferences prefs;
  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;
    try {
      List<BaseMessage> messages = await widget.groupChannel.getMessagesByTimestamp(
          DateTime.now().millisecondsSinceEpoch * 1000, MessageListParams());
      setState(() {
        _messages = messages;
      });
    } catch (e) {
      print('group_channel_view.dart: getMessages: ERROR: $e');
    }

    for(int i = 0; i<widget.groupChannel.members.length;i++){
      if (widget.groupChannel.members[i].userId != id){
        var a = PlayerService().detailPlayer(widget.groupChannel.members[i].userId);
        print(a.toString());
        a?.then((result) {
          setState(() => adversaire = result);
        });
        setState(() {
          adversaireSB = widget.groupChannel.members[i];
        });

      }
      print("hello"+widget.groupChannel.members.toString());

    }
    SendbirdSdk().addChannelEventHandler(widget.groupChannel.channelUrl, this);
    return true;

  }

  @override
  void initState() {
    super.initState();
    fetchedUser = fetchUser();


  }

  @override
  void dispose() {
    SendbirdSdk().removeChannelEventHandler(widget.groupChannel.channelUrl);
    super.dispose();
  }

  @override
  onMessageReceived(channel, message) {
    setState(() {
      _messages.add(message);
    });
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  fetchedUser,
        builder: (context, snapshot) {

          if(snapshot.hasData && adversaireSB != null){
            return Scaffold(
                appBar: navigationBar(widget.groupChannel),
                body: body(context),
            );
          }
          else{
            return Scaffold();
          }
        }

    );
  }

  AppBar navigationBar(GroupChannel channel) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Row(

        children: [
          BackButton(onPressed: (){

            Navigator.pop(context);
          },color: Colors.black,),

          Image(image: true ? NetworkImage(adversaireSB!.profileUrl!) : AssetImage('assets/images/footnews1.png') as ImageProvider,
          height: 56,
          width: 56),
          Container(
            child: Text(
                adversaireSB!.nickname.toString(),
            style: TextStyle(color: Colors.black,fontSize: 25)),

            ),

        ],
      ),

    );
  }

  Widget body(BuildContext context) {
    ChatUser user = asDashChatUser(SendbirdSdk().currentUser!);
    return Padding(
      // A little breathing room for devices with no home button.
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 40),
      child: DashChat(
        leading: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateMatchScreen( user: adversaire!,)));
            },
            icon: Icon(Icons.add),color: footballColorPrimary,)
        ],
        dateFormat: DateFormat("E, MMM d"),
        timeFormat: DateFormat.jm(),
        showUserAvatar: true,
        key: Key(widget.groupChannel.channelUrl),
        onSend: (ChatMessage message) async {
          var sentMessage =
          widget.groupChannel.sendUserMessageWithText(message.text!);
          setState(() {
            _messages.add(sentMessage);
          });
        },
        sendOnEnter: true,
        textInputAction: TextInputAction.send,
        user: user,
        messages: asDashChatMessages(_messages),
        inputDecoration:
        InputDecoration.collapsed(hintText: "Type a message here..."),
        messageDecorationBuilder: (ChatMessage msg, bool? isUser) {
          return BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: isUser!
                ? Theme.of(context).primaryColor
                : Colors.grey[200], // example
          );
        },
      ),
    );
  }

  List<ChatMessage> asDashChatMessages(List<BaseMessage> messages) {
    // BaseMessage is a Sendbird class
    // ChatMessage is a DashChat class
    List<ChatMessage> result = [];
    if (messages != null) {
      messages.forEach((message) {
        User user = message.sender as User;
        if (user == null) {
          return;
        }
        result.add(
          ChatMessage(
            createdAt: DateTime.fromMillisecondsSinceEpoch(message.createdAt),
            text: message.message,
            user: asDashChatUser(user),
          ),
        );
      });
    }
    return result;
  }

  ChatUser asDashChatUser(User user) {
    return ChatUser(
      name: user.nickname,
      uid: user.userId,
      avatar: user.profileUrl,
    );
  }
}
