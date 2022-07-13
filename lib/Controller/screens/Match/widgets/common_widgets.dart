import 'package:flutter/material.dart';


class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({Key? key,required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          rating.floor(), (index) => Icon(Icons.star,color: Colors.white,size: 16)),
    );
  }
}
