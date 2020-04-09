import 'package:flutter/material.dart';
import 'package:AniFree/constants.dart';

class InfoCard extends StatelessWidget {
  final String img;
  final String title;
  final String duration;
  final String episode;
  InfoCard({this.img, this.title, this.duration, this.episode = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: backgroundColor,
      child: Card(
        elevation: 5,
        color: cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        //elevation: 4.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: ClipRRect(
                  child: Image(image: NetworkImage(img), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0)),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: cardTextStyle),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Text(
                          episode,
                          style: subTitleStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
