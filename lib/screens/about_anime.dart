import 'package:AniFree/constants.dart';
import 'package:flutter/material.dart';

class AboutAnime extends StatelessWidget {
  static String id = 'about_anime';
  final String animeLink;
  final String imageLink;
  AboutAnime({this.animeLink,this.imageLink});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Hero(
                tag: imageLink,
                child: Container(
                  height: 500,
                  child: Image(
                  image: NetworkImage(imageLink),
                  fit: BoxFit.cover,
                  ),
                ),
            ),
            Expanded(
              child: Container(
                child: Text(animeLink),
              ),
            )
          ],

        ) 
      ),
    );
  }
}