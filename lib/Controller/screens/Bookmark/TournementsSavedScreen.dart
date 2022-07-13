import 'package:flutter/material.dart';
import 'data/listItemsDataTournement.dart';
import 'model/ListItem.dart';




class TournementsSavedScreen extends StatefulWidget {
  const TournementsSavedScreen({Key? key}) : super(key: key);

  @override
  _TournementsSavedScreenState createState() => _TournementsSavedScreenState();
}

class _TournementsSavedScreenState extends State<TournementsSavedScreen> {
  final listKey = GlobalKey<AnimatedListState>();
  final List<ListItem> items = List.from(listItemsTournement);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return ListItemWidget(
              item: items[index],
              animation: animation,
              onClicked: () {
                removeItem(index);
              });
        },
      ));

  }
  void removeItem(int index) {
    final removedItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
            (context, animation) => ListItemWidget(
          item: removedItem,
          animation: animation,
          onClicked: () {
            //todo remove from sharedpref
          },
        ),
        duration: Duration(milliseconds: 600));
  }
}
class ListItemWidget extends StatelessWidget {
  final ListItem item;
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
      key: ValueKey(item.urlImage),
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
          backgroundImage: NetworkImage(item.urlImage),
        ),
        title: Text(
          item.title,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          item.description,
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