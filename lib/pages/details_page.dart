import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:app_shoe/core/const.dart';
import 'dart:math' as math;
import 'package:app_shoe/models/shoe_model.dart';
import 'package:app_shoe/widgets/app_clipper.dart';

class DetailsPage extends StatefulWidget {
  final ShoeModel shoeModel;

  const DetailsPage({Key key, this.shoeModel}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
   //     backgroundColor: widget.shoeModel.color,
        leading: Container(
          padding: EdgeInsets.only(left: 15),
          child: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Container(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * .4),
          child: Text('CATEGORIES'),
        ),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: AppClipper(
                    cornerSize: 50, diagonalHeight: 200, roundedBottom: false),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 200),
                          width: 270,
                          child: Text(
                            widget.shoeModel.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            RatingBar(
                              itemSize: 20,
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(width: 15),
                            Text('138 reviews')
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'DETAILS',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Text(
                            widget.shoeModel.desc,
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'COLOR OPTIONS',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            colorOptions(AppColors.blueColor),
                            colorOptions(AppColors.greenColor),
                            colorOptions(AppColors.orangeColor),
                            colorOptions(AppColors.redColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                          text: 'PRICE\n',
                          children: <TextSpan>[
                            TextSpan(
                                text: '\$${widget.shoeModel.price}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                          ]),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Text(
                          'ADD CART',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      color: AppColors.greenColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 50,
              top: 35,
              child: Transform.rotate(
                  angle: -math.pi/7,
                  child: Image.asset(
                    'assets/${widget.shoeModel.imgPath}',
                    width: MediaQuery.of(context).size.width * .85,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget colorOptions(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
