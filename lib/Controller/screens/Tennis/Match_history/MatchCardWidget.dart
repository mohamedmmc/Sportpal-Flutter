import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportpal/Model/Terrain.dart';

import '../../../../Model/Matche.dart';
import '../../../../Model/Player.dart';
import '../../../../Model/Team.dart';
import 'MatchHistoryDetail.dart';

class TennisMatchCard extends StatefulWidget {
  const TennisMatchCard({Key? key,required this.match, required this.adversaire}) : super(key: key);

  final Matche match;
  final Player adversaire;

  @override
  _TennisMatchCardState createState() => _TennisMatchCardState();
}

class _TennisMatchCardState extends State<TennisMatchCard> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MatchHistoryDetailTennis(match: widget.match,adversaire: widget.adversaire,)));
          },
          child: Container(
            height: 151,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(128, 128, 128, 0.1)),
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(128, 128, 128, 0.05)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 14, left: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.match.terrain!.typeSport!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff808080)),
                      ),
                      Text(
                        widget.match.date!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff808080)),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Color.fromRGBO(40, 140, 140, 0.1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 8, top: 16),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.green,
                        height: 54,
                        width: 4,
                      ),
                      Image.network(
                        widget.match.teamB!.players[0]!.profilePic!,
                        height: 38,
                        width: 38,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          widget.match.teamB!.players[0]!.fullName!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              color: Color(0xff263238),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "6",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "2",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "3",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "6",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "5",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 8, top: 16),
                  child: Row(
                    children: [
                      Image.network(
                        widget.match.teamA!.players[0]!.profilePic!,
                        height: 38,
                        width: 38,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        widget.match.teamA!.players[0]!.fullName!,
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        "4",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "6",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "6",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "4",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "7",
                        style: GoogleFonts.poppins(
                            color: Color(0xff263238),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
