import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportpal/Controller/screens/hallOfFame/ShowBestTeamPlayers.dart';
import 'package:sportpal/Controller/screens/home/MenuWidget.dart';
import 'package:sportpal/constants.dart';

import '../../../variables.dart';


class HallOfFameFootball extends StatefulWidget {
  const HallOfFameFootball({Key? key}) : super(key: key);

  @override
  _HallOfFameFootballState createState() => _HallOfFameFootballState();
}

class _HallOfFameFootballState extends State<HallOfFameFootball> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(
          "classement",
          style: TextStyle(
              fontSize: appBarTitleSize
          ),
        ),
        centerTitle: true,
        leading: MenuWidget(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) =>
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                    minWidth: constraints.maxWidth
                ),
                child: IntrinsicWidth(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: DataTable(
                          //border: TableBorder.all(),
                          columns: const [
                            DataColumn(
                              label: Text("Picture", style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),),
                            ),
                            DataColumn(label: Text("name", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24))),
                            DataColumn(label: Text("Match played",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                                numeric: true),
                            DataColumn(label: Text("Victories",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 24))),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.looks_one,
                                        size: 25,
                                        color: Colors.amberAccent,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            border: Border.all(
                                                color: Colors.amberAccent,
                                                width: 1.2),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/esprit.jpg"))),
                                      ),
                                    ],
                                  ),
                              ),
                              const DataCell(
                                  Center(
                                    child: Text(
                                      "Esprit",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.amberAccent),
                                    ),
                                  )),
                              DataCell(
                                Center(
                                  child: Text(
                                    "70",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.amberAccent),
                                  ),
                                ),
                              ),
                              DataCell(Center(
                                child: Text(
                                  "59",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.amberAccent),
                                ),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.looks_two_rounded,
                                    size: 22,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        border: Border.all(
                                            color: Colors.blue, width: 1.2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Tekup.png"))),
                                  ),
                                ],
                              )),
                              DataCell(Center(
                                child: Text("Tekup",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),),
                              )),
                              DataCell(Center(
                                child: Text("65",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),),
                              )),
                              DataCell(Center(
                                child: Text("43",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.diceThree,
                                    size: 22,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        border: Border.all(
                                            color: Colors.blue, width: 1.2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Sesame.png"))),
                                  ),
                                ],
                              )),
                              DataCell(Center(
                                child: Text("Sesame", style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green)),
                              )),
                              DataCell(Center(
                                child: Text("60", style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green)),
                              )),
                              DataCell(Center(
                                child: Text("32", style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green)),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.users,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        border: Border.all(
                                            color: Colors.blue, width: 1.2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/fbteam.png"))),
                                  ),
                                ],
                              )),
                              DataCell(Center(child: Text("Team A",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                              DataCell(Center(child: Text("55",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                              DataCell(Center(child: Text("21",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                            ]),
                            DataRow(cells: [
                              DataCell(Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.users,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        border: Border.all(
                                            color: Colors.blue, width: 1.2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/fbteam.png"))),
                                  ),
                                ],
                              )),
                              DataCell(Center(child: Text("Team B",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                              DataCell(Center(child: Text("40",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                              DataCell(Center(child: Text("11",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                            ]),
                            DataRow(cells: [
                              DataCell(Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.users,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        border: Border.all(
                                            color: Colors.blue, width: 1.2),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/fbteam.png"))),
                                  ),
                                ],
                              )),
                              DataCell(Center(child: Text("Team C ",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                              DataCell(Center(child: Text("23",
                                  style: TextStyle(fontSize: 15,
                                      fontWeight: FontWeight.w500)))),
                              DataCell(Center(child: Text("5", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),))),
                            ]),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ),),

    );
  }
}

class ListWheelScrollViewX extends StatelessWidget {
  final Axis scrollDirection;
  final List<Widget>? children;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final double diameterRatio;
  final double perspective;
  final double offAxisFraction;
  final bool useMagnifier;
  final double magnification;
  final double overAndUnderCenterOpacity;
  final double itemExtent;
  final double squeeze;
  final ValueChanged<int>? onSelectedItemChanged;
  final bool renderChildrenOutsideViewport;
  final ListWheelChildDelegate? childDelegate;
  final Clip clipBehavior;

  const ListWheelScrollViewX({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.physics,
    this.diameterRatio = RenderListWheelViewport.defaultDiameterRatio,
    this.perspective = RenderListWheelViewport.defaultPerspective,
    this.offAxisFraction = 0.0,
    this.useMagnifier = false,
    this.magnification = 1.0,
    this.overAndUnderCenterOpacity = 1.0,
    required this.itemExtent,
    this.squeeze = 1.0,
    this.onSelectedItemChanged,
    this.renderChildrenOutsideViewport = false,
    this.clipBehavior = Clip.hardEdge,
    required this.children,
  })
      : childDelegate = null,
        super(key: key);

  const ListWheelScrollViewX.useDelegate({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.physics,
    this.diameterRatio = RenderListWheelViewport.defaultDiameterRatio,
    this.perspective = RenderListWheelViewport.defaultPerspective,
    this.offAxisFraction = 0.0,
    this.useMagnifier = false,
    this.magnification = 1.0,
    this.overAndUnderCenterOpacity = 1.0,
    required this.itemExtent,
    this.squeeze = 1.0,
    this.onSelectedItemChanged,
    this.renderChildrenOutsideViewport = false,
    this.clipBehavior = Clip.hardEdge,
    required this.childDelegate,
  })
      : children = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _childDelegate = children != null
        ? ListWheelChildListDelegate(
        children: children!.map((child) {
          return RotatedBox(
            quarterTurns: scrollDirection == Axis.horizontal ? 1 : 0,
            child: child,
          );
        }).toList())
        : ListWheelChildBuilderDelegate(
      builder: (context, index) {
        return RotatedBox(
          quarterTurns: scrollDirection == Axis.horizontal ? 1 : 0,
          child: childDelegate!.build(context, index),
        );
      },
    );

    return RotatedBox(
      quarterTurns: scrollDirection == Axis.horizontal ? 3 : 0,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        physics: FixedExtentScrollPhysics(),
        diameterRatio: diameterRatio,
        perspective: perspective,
        offAxisFraction: offAxisFraction,
        useMagnifier: useMagnifier,
        magnification: magnification,
        overAndUnderCenterOpacity: overAndUnderCenterOpacity,
        itemExtent: itemExtent,
        squeeze: squeeze,
        onSelectedItemChanged: onSelectedItemChanged,
        renderChildrenOutsideViewport: renderChildrenOutsideViewport,
        clipBehavior: clipBehavior,
        childDelegate: _childDelegate,
      ),
    );
  }
}