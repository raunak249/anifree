import 'package:flutter/material.dart';
import 'package:AniFree/components/info_card.dart';
import 'package:AniFree/constants.dart';

class RecentAnime extends StatelessWidget {
  final List imgList = ['assets/image1.jpg','assets/image2.jpg','assets/image3.jpg','assets/image4.jpg','assets/image5.jpg'];
  final List animeNames = ['Mob Psycho 100','One Piece','Showa Genroku Rakugo Shinji','Boku no Hero Academia','Kakegurui'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Discover',
                        style: mainTitleStyle,
                      ),
                      Text(
                        'Recently added anime',
                        style:TextStyle(
                        color : iconColor,
                        fontWeight: FontWeight.w200
                        ),
                      )
                    ],
                  ),
                ) 
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: imgList.length,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: InfoCard(
                  img:imgList[index],
                  duration: '23m',
                  title: animeNames[index],
                ),
              );
            },
            ),
          )
          //InfoCard(img: 'assets/image1.jpg',duration: '23m',title: 'MOB PSYCHO 100'),
          //InfoCard()
        ],
      ),
    );
  }
}