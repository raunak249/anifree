import 'package:flutter/material.dart';
import 'package:AniFree/components/carousel.dart';
import 'package:AniFree/components/custom_appbar.dart';
import 'package:AniFree/components/recent_anime.dart';
import 'package:AniFree/constants.dart';

class AnimeHome extends StatelessWidget {
  static String id = 'anime_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomAppBar(),
            Carousel(),
            RecentAnime()
          ],
        ),
      ),
    );
  }
}