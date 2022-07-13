import 'package:flutter/material.dart';

import '../../../../Model/News.dart';
import '../../../../constants.dart';


class SecondaryCard extends StatelessWidget {
  final News news;
  SecondaryCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: kGrey3, width: 1.0),
      ),
      child: Row(
        children: [
          Container(
            width: 90.0,
            height: 135.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: true ? NetworkImage(news.imageURL!) : AssetImage('assets/images/footnews1.png') as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  SizedBox(height: 4.0),
                  if(news.desc!=null)...[
                    Text(
                      news.desc!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: kDetailContent,
                    ),
                  ],

                  Spacer(),
                  // Row(
                  //   children: [
                  //     Text(news.time, style: kDetailContent),
                  //     SizedBox(width: 10.0),
                  //     CircleAvatar(
                  //       radius: 5.0,
                  //       backgroundColor: kGrey1,
                  //     ),
                  //     SizedBox(width: 10.0),
                  //     Text(
                  //       "${news.estimate} min read",
                  //       style: kDetailContent,
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}