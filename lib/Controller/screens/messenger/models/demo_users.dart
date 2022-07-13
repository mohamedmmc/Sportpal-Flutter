import 'package:flutter/material.dart';

const users = [
  userSaif,
  userHbib,
  userGhazi,
  userMalek
];


const userGhazi = DemoUser(
  id: 'ghazi',
  name: 'Ghazi Bel Hadj Yahia',
  image:
  'https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/93998046_3174161915968288_587966424228560896_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=oBnWxQ3z75oAX8Y2DhP&_nc_ht=scontent.ftun8-1.fna&oh=00_AT9zyr6ZSeaxNgLNaxa1QDoYzmzJBFsBcsw8-ouborvF_g&oe=6282A5DF',
);


const userSaif = DemoUser(
  id: 'saif',
  name: 'Gouider saif',
  image:
  'https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/134406410_10220558388322106_27933639126927387_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=sxJO585P9_AAX9eHkmg&tn=UmE5QBE7PFsz8hlq&_nc_ht=scontent.ftun8-1.fna&oh=00_AT851gxS6HGh-lETFKfHbW-59kyE-rr9CrE9qSGyEvNlng&oe=62849AC9',
);

const userHbib = DemoUser(
  id: 'hbib',
  name: 'Msahel Hbib',
  image:
  'https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/51982056_2480244275336321_2897163948929318912_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lHDcfo_18gIAX9Sm3tr&tn=UmE5QBE7PFsz8hlq&_nc_ht=scontent.ftun8-1.fna&oh=00_AT-NATq3E-FZ2kJKC6RjarlKek3oXvGDjavV_ZEQYHE-dA&oe=62813A27',
);

const userMalek = DemoUser(
  id: 'malek',
  name: 'Mohamed Malek Chtourou',
  image:
  'https://res.cloudinary.com/dy05x9auh/image/upload/v1651627145/181685855_2901469286790793_4996339657213027024_n_lfiplr.jpg',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}