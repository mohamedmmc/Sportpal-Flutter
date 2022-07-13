import 'package:flutter/material.dart';
import 'package:sportpal/Model/Favorites.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportpal/Service/FavoriteService.dart';
import '../../../Model/Matche.dart';
import '../../../Model/Player.dart';
import 'data/listItemsData.dart';
import 'model/ListItem.dart';

class TeamsSavedScreen extends StatefulWidget {
  const TeamsSavedScreen({Key? key}) : super(key: key);

  @override
  _TeamsSavedScreenState createState() => _TeamsSavedScreenState();
}

class _TeamsSavedScreenState extends State<TeamsSavedScreen> {
  final listKey = GlobalKey<AnimatedListState>();
  late Future<bool> fetchedUser;
  late String id;
  final List<Player> fav = [];
  late SharedPreferences prefs;

  Future<bool> fetchUser() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString("_id")!;

    var test = await FavoriteService().getFavs(id);
    test?.forEach((element) {
      fav.add(element);
    });
    setState(() {});

    return true;
  }

  @override
  void initState() {
    fetchedUser = fetchUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: fetchedUser,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                return AnimatedList(
                  key: listKey,
                  initialItemCount: fav.length,
                  itemBuilder: (context, index, animation) {
                    return ListItemWidget(
                        item: fav[index],
                        animation: animation,
                        onClicked: () async {
                          var a =
                              await FavoriteService().delFavs(fav[index].id!);
                          print("resultat : " + a.toString());
                          final removedItem = fav[index];
                          fav.removeAt(index);
                          listKey.currentState!.removeItem(
                              index,
                              (context, animation) => ListItemWidget(
                                    item: removedItem,
                                    animation: animation,
                                    onClicked: () async {},
                                  ),
                              duration: Duration(milliseconds: 600));
                        });
                  },
                );
              } else {
                return const Center(
                  child: Text("No favorite player added"),
                );
              }
            }));
  }

// void removeItem(int index) {
//   final removedItem = fav[index];
//   fav.removeAt(index);
//   listKey.currentState!.removeItem(
//       index,
//       (context, animation) => ListItemWidget(
//             item: removedItem,
//             animation: animation,
//             onClicked: () async{
//               var a = await FavoriteService().delFavs(removedItem.id!);
//               print("resultat : "+a.toString());
//             },
//           ),
//       duration: Duration(milliseconds: 600));
// }
}

class ListItemWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: buildItem(),
      key: ValueKey(item.fullName),
    );
  }

  Widget buildItem() {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.profilePic!),
          radius: 32,
        ),
        title: Text(
          item.fullName.toString(),
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          item.birthDate.toString(),
          style: TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          iconSize: 32,
          onPressed: onClicked,
        ),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
