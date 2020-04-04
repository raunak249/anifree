import 'package:flutter/material.dart';
import 'package:AniFree/constants.dart';

class InfoCard extends StatelessWidget {
  final String img;
  final String title;
  final String duration;
  InfoCard({this.img,this.title,this.duration}); 

  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 4.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex : 3,
                child: Container(
                child: ClipRRect(
                  child: Image(image: AssetImage(img)),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
                ),
              ),
            ),
            Expanded(
                flex  :6,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: Text(
                  title,
                  style: subTitleStyle,
              ),
                ),
            ),
            Expanded(
                flex :2, 
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(duration)
                  ],
              ),
                ),
            )
          ],
        ),
      ),
    );
  }
}