import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportpal/Controller/authentification/signIn.dart';

import '../../../../Model/News.dart';
import '../../../../Service/NewsService.dart';

class homeNavBar extends StatefulWidget {
  @override
  homeNavBarState createState() => homeNavBarState();
}

class homeNavBarState extends State<homeNavBar> {
  int currentIndex = 0;
  final List<News> _news = [];
  late Future<bool> fetchedNews;

  @override
  void initState() {
    fetchedNews =  NewsService().getNews(_news);
    print(_news);
    super.initState();
  }
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
  bool  isFootballTrue = false;
  bool  isTennisTrue = false;
  bool  isBasketballTrue = false;
  bool  isAllTrue = true;

  Future<void> _ButtoncolorFoot() async {
    setState(() {
      isFootballTrue=true;
      isTennisTrue=false;
      isBasketballTrue=false;
      isAllTrue=false;
    });
  }
  Future<void> _ButtoncolorBasket() async {
    setState(() {
      isFootballTrue=false;
      isTennisTrue=false;
      isBasketballTrue=true;
      isAllTrue=false;
    });
  }
  Future<void> _ButtoncolorTennis() async {
    setState(() {
      isFootballTrue=false;
      isTennisTrue=true;
      isBasketballTrue=false;
      isAllTrue=false;
    });
  }
  Future<void> _ButtoncolorAll() async {
    setState(() {
      isFootballTrue=false;
      isTennisTrue=false;
      isBasketballTrue=false;
      isAllTrue=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text("News", style: TextStyle(color: Colors.grey[80],
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 2.5,
                            child: GestureDetector(
                              onTap: (){
                                _ButtoncolorAll();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: isAllTrue ? Colors.yellow[700] : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Align(
                                  child: Text(
                                    'All', style: TextStyle(
                                    color: isAllTrue ? Colors.white : Colors.grey[700],
                                    fontSize: 18,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          AspectRatio(
                            aspectRatio: 2.5,
                            child: GestureDetector(
                              onTap: (){
                                _ButtoncolorFoot();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: isFootballTrue ? Colors.yellow[700] : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Align(
                                  child: Text(
                                    'Football', style: TextStyle(
                                    color: isFootballTrue ? Colors.white : Colors.grey[700],
                                    fontSize: 18,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          AspectRatio(
                            aspectRatio: 2.5,
                            child: GestureDetector(
                              onTap: (){
                                _ButtoncolorTennis();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: isTennisTrue ? Colors.yellow[700] : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Align(
                                  child: Text(
                                    'Tennis', style: TextStyle(
                                    color: isTennisTrue ? Colors.white : Colors.grey[700],
                                    fontSize: 18,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          AspectRatio(
                            aspectRatio: 2.5,
                            child: GestureDetector(
                              onTap: (){
                                _ButtoncolorBasket();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: isBasketballTrue ? Colors.yellow[700] : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Align(
                                  child: Text(
                                    'Basketball', style: TextStyle(
                                    color: isBasketballTrue ? Colors.white : Colors.grey[700],
                                    fontSize: 18,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('keep updated', style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FutureBuilder(

                    future: fetchedNews ,
                    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if(snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return _makeItem(image: _news[index].imageURL!,subtitle: _news[index].title!.substring(0,28)+"...",title: _news[index].title!.substring(0,25)+"...");
                          }
                        );
                      }
                      else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 30,),
              // ListTile(
              //   //leading: Image.network(_news[1].imageURL!),
              //   title: Text("_news[1].title!",
              //     style: TextStyle(
              //       fontSize: 20
              //     ),
              //   ),
              //   //subtitle: Text(_news[1].desc!.substring(0,20)),
              //   trailing: Icon(Icons.menu),
              //   isThreeLine: true,
              //   dense: true,
              //   onTap: (){
              //
              //   },
              // ),
              SizedBox(height: 10),
              ListTile(
                leading: CircleAvatar(),
                title: Text("Widget of the day",style: TextStyle(
                    fontSize: 20
                ),),
                subtitle: Text("ghazi is tahan"),
                trailing: Icon(Icons.menu),
                isThreeLine: true,
                dense: true,
                onTap: (){

                },
              ),



            ],
          ),
        ],
      ),
    );
  }
}


Widget _makeItem({required String image, required String title, required String subtitle}) {
  return AspectRatio(
    aspectRatio: 1 / 1.4,
    child: GestureDetector(
      onTap: (){
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: true ? NetworkImage(image) : AssetImage('assets/images/footnews1.png') as ImageProvider,
            fit: BoxFit.cover,

          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  stops: [.2,.9],
                  colors: [
                    Colors.black.withOpacity(.1),
                    Colors.black.withOpacity(.3)
                  ]
              )
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite,color: Colors.white,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title,style: TextStyle(color:Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(subtitle,style: TextStyle(color:Colors.white,fontSize: 18),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
