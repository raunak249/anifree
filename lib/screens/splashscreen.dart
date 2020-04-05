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
  var recent_anime_data;
  var popular_anime_data;
  var recent_anime_decoded;
  var popular_anime_decoded;
  String home = "https://animekisa.tv";
  List recent_anime_names = [];
  List recent_anime_images =[];
  List recent_anime_episodes = [];
  List recent_anime_links =[];
  List popular_anime_names = [];
  List popular_anime_images =[];
  List popular_anime_links =[];
  void getAnime() async {
    recent_anime_data = await getRecentAnime('https://anifree-api.herokuapp.com/recent_anime');
    recent_anime_decoded = jsonDecode(recent_anime_data);
    for (var item in recent_anime_decoded) {
      recent_anime_names.add(item['name']);
      recent_anime_images.add(home + item['image_link']);
      recent_anime_episodes.add(item['episode_num']);
      recent_anime_links.add(home + item['link']);
    }
    popular_anime_data = await getRecentAnime('https://anifree-api.herokuapp.com/popular_anime');
    popular_anime_decoded = jsonDecode(popular_anime_data);
    for (var item in popular_anime_decoded) {
      popular_anime_names.add(item['name']);
      popular_anime_images.add(home + item['image_link']);
      popular_anime_links.add(home + item['anime_link']);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => AnimeHome(recent_anime_names: recent_anime_names,recent_anime_images: recent_anime_images,recent_anime_episodes: recent_anime_episodes,recent_anime_links: recent_anime_links,popular_anime_images: popular_anime_images, popular_anime_links: popular_anime_links ,popular_anime_names: popular_anime_names)));
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

