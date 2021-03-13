import 'package:app_shoe/models/firestore_service.dart';
import 'package:app_shoe/widgets/app_clipper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_shoe/core/const.dart';
import 'package:app_shoe/core/flutter_icons.dart';
import 'package:app_shoe/models/shoe_model.dart';
import 'package:app_shoe/pages/details_page.dart';
import 'dart:math' as math;

import '../models/shoe_model.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<ShoeModel> shoeList = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: ListView(),
      ),
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(FlutterIcons.menu,color: Colors.black,size: 30,),
            onPressed: ()=>Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(widget.user.email,style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.grey,
                  onPressed: null,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 30),
            child: StreamBuilder(
                stream: FirestoreService().getShoe(),
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  if (snapshot.hasError || !snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        ShoeModel shoe = snapshot.data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(shoeModel: shoe)));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: Stack(
                              children: [
                                ClipPath(
                                  clipper:
                                  AppClipper(cornerSize: 25, diagonalHeight: 90),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 230,
                                        color: AppColors.greenColor,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30, left: 10),
                                                child: shoe.brand == "Nike"
                                                    ? Icon(
                                                  FlutterIcons.nike,
                                                  color: Colors.black,
                                                  size: 40,
                                                )
                                                    : Icon(
                                                  FlutterIcons.converse,
                                                  color: Colors.black,
                                                  size: 40,
                                                )),
                                            Expanded(
                                              child: SizedBox(),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(left: 15),
                                                width: 130,
                                                child: Text(
                                                  '${shoe.name}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )),
                                            SizedBox(height: 15),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 15, bottom: 25),
                                              child: Text(
                                                '\$${shoe.price}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -5,
                                        right: -5,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          child: Center(
                                            child: IconButton(
                                              icon: Icon(
                                                FlutterIcons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.greenColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 10,
                                                blurRadius: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 15,
                                  bottom: 140,
                                  child: Transform.rotate(
                                      angle: -math.pi / 7,
                                      child: Image.network(
                                        shoe.imgPath,
                                        width: 200,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'JUST FOR YOU',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  'VIEW ALL',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greenColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 300,
            child: StreamBuilder(
                stream: FirestoreService().getShoe(),
                builder: (BuildContext context,
                    AsyncSnapshot snapshot) {
                  if (snapshot.hasError || !snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        ShoeModel shoe = snapshot.data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(shoeModel: shoe),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  Image.network(
                                    shoe.imgPath,
                                    height: 100,
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width * .4,
                                          child: Text(
                                            shoe.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          shoe.brand,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\$${shoe.price}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.grey,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.compass),
              title: Text("Data"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.list),
              title: Text("Data"),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.bag),
              title: Text("Data"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.person_outline,
              ),
              title: Text("Data"),
            ),
          ],
        ),
      ),
    );
  }
}
