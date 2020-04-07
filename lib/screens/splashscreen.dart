import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:AniFree/api/api.dart';
import 'package:AniFree/screens/anime_home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:AniFree/constants.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splashscreen'; 

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var recentAnimeData;
  var popularAnimeData;
  var recentAnimeDecoded;
  var popularAnimeDecoded;
  String home = "https://www.gogoanime.io";
  List recentAnimeNames = [];
  List recentAnimeImages =[];
  List recentAnimeEpisodes = [];
  List recentAnimeLinks =[];
  List popularAnimeNames = [];
  List popularAnimeImages =[];
  List popularAnimeLinks =[];
  void getAnime() async {
    recentAnimeData = await fetch(HOME + '/recent_anime');
    recentAnimeDecoded = jsonDecode(recentAnimeData);
    for (var item in recentAnimeDecoded) {
      recentAnimeNames.add(item['name']);
      recentAnimeImages.add(item['image_link']);
      recentAnimeEpisodes.add(item['episode_num']);
      recentAnimeLinks.add(item['link']);
    }
    popularAnimeData = await fetch(HOME + '/popular_anime');
    popularAnimeDecoded = jsonDecode(popularAnimeData);
    for (var item in popularAnimeDecoded) {
      popularAnimeNames.add(item['name']);
      popularAnimeImages.add(item['image_link']);
      popularAnimeLinks.add(item['anime_link']);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => AnimeHome(recentAnimeNames: recentAnimeNames,recentAnimeImages: recentAnimeImages,recentAnimeEpisodes: recentAnimeEpisodes,recentAnimeLinks: recentAnimeLinks,popularAnimeImages: popularAnimeImages, popularAnimeLinks: popularAnimeLinks ,popularAnimeNames: popularAnimeNames)));
  }
  
  @override
  void initState() {
    getAnime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        color: splashSceenColor,
        child: Center(
          child: TypewriterAnimatedTextKit(
              text: ['ANIFREE'],
              textStyle: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'PressStart2P'
              ),
              speed: Duration(milliseconds: 500),
              isRepeatingAnimation: false,
          ),
        ),
      ),
    );
  }
}

