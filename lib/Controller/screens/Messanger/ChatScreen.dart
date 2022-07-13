import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:sportpal/variables.dart';
import '../../../Model/Player.dart';
import '../../../Model/User.dart';
import '../../../constants.dart';
import '../Match/CreateMatch.dart';
import '../profil/aboutMe/aboutMeScreen.dart';
import 'Model/Message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.user}) : super(key: key);
  final Player user;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        text: 'Waa haboub ',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'aya winek chaaml',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'Ahla sifon walahi hani hamdoulah',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'aya nadhmoulha trayah f lac nhar jemaa',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    Message(
        text: 'walahi ena bidi aandi barcha chehi torh',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: 'Ekhtarelna ay wakt baaed l khedma maaneha m 18h w enty tala3',
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AboutMeScreen(
                            fullName: widget.user.fullName!,
                            profilePic: widget.user.profilePic!,
                            birthDate: widget.user.birthDate,
                            friends: widget.user.friends!.length.toString(),
                          )));
            },
            child: Text(widget.user.fullName!)),
        backgroundColor: themeColor,
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
            padding: const EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            elements: messages,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.date),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                color: message.isSentByMe ? footballColorPrimary : Colors.white,
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(message.text),
                ),
              ),
            ),
          )),
          Container(
            color: Colors.grey.shade300,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateMatchScreen(
                                      user: widget.user,
                                    )));
                      },
                      icon: Icon(Icons.add),
                      color: footballColorPrimary,
                    )),
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(12),
                      hintText: "Type your message here",
                    ),
                    onSubmitted: (text) {
                      final message = Message(
                          text: text, date: DateTime.now(), isSentByMe: true);
                      setState(() {
                        messages.add(message);
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
