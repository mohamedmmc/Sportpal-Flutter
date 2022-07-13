import 'package:flutter/material.dart';
import 'package:sportpal/constants.dart';
import 'package:sportpal/variables.dart';

import '../../../Model/Player.dart';
import '../../../Model/UserTInder.dart';
import '../../../Service/NotificationService.dart';
import '../Bookmark/data/listItemsData.dart';
import 'package:sportpal/Model/Notification.dart' as notif;
import 'package:shared_preferences/shared_preferences.dart';
class JoinTeamRequests extends StatefulWidget {
  const JoinTeamRequests({Key? key}) : super(key: key);

  @override
  _JoinTeamRequestsState createState() => _JoinTeamRequestsState();
}

class _JoinTeamRequestsState extends State<JoinTeamRequests> {

  final listKey = GlobalKey<AnimatedListState>();
  final List<UserTinder> items = List.from(listItemsRequests);
  late Future<bool> fetchedUser;
  late String id;
  final List<notif.Notification> news = [];
  late SharedPreferences prefs;


  Future<bool> fetchUser() async {

    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;

    print(id);
    var test = await NotificationService().getNotifications(id);
    test?.forEach((element) {
      if(!element.accept){

        if(element.type! == "Join request" && id!=element.from?.id!){
          news.add(element);

        }
        print(news);
      }
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
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          "join requests",
          style: TextStyle(
            fontSize: appBarTitleSize,
          ),
        ),
        centerTitle: true,
      ),
      body:FutureBuilder(
          future: fetchedUser ,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if(snapshot.hasData) {
              return AnimatedList(
                key: listKey,
                initialItemCount: news.length,
                itemBuilder: (context, index, animation) {
                  return ListItemWidget(
                      item: news[index].from!,
                      animation: animation,
                      onAccept: () async{
                        acceptItem(index);




                      },
                      onDelete: (){
                        removeItem(index);

                      });
                },
              );
            }

            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ));
  }

  void removeItem(int index)async{
    final removedItem = news[index];
    print(id);
    print(news[index].from!.id!);
    var deletedNotif = await NotificationService().deleteMYnotif( news[index].from!.id!,id);
    print(deletedNotif);
    news.removeAt(index);
    listKey.currentState!.removeItem(
        index,
            (context, animation) => ListItemWidget(
            item: removedItem.from!,
            animation: animation,
            onAccept: () async{

            },
            onDelete: (){

            }
        ),
        duration: Duration(milliseconds: 600));
  }

  void acceptItem(int index)async{
    final removedItem = news[index];
    print(id);
    print(news[index].from!.id!);
    var confirm = await NotificationService().confirmNotifJoin(news[index].from!.id!,id );
    print(confirm);
    news.removeAt(index);
    listKey.currentState!.removeItem(
        index,
            (context, animation) => ListItemWidget(
            item: removedItem.from!,
            animation: animation,
            onAccept: () async{

            },
            onDelete: (){

            }
        ),
        duration: Duration(milliseconds: 600));
  }

}

class ListItemWidget extends StatelessWidget {
  final Player item;
  final Animation<double> animation;
  final VoidCallback? onAccept;
  final VoidCallback? onDelete;

  const ListItemWidget(
      {Key? key,
        required this.item,
        required this.animation,
        this.onAccept,
        this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: buildItem(),
      key: ValueKey(item.profilePic),
    );
  }

  Widget buildItem() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ListTile(
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(item.profilePic!),
        ),
        title: Text(
          item.fullName!,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          item.birthDate.toString(),
          style: TextStyle(fontSize: 12),
        ),
        trailing: Container(
          width: 102,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.check_circle),
                color: Colors.green,
                iconSize: 30,
                onPressed: onAccept,
              ),
              SizedBox(width: 5,),
              IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  iconSize: 30,
                  onPressed: onDelete
              ),
            ],
          ),
        ),
      ),
    );
  }
}
