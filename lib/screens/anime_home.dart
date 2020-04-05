import 'package:flutter/material.dart';
import 'package:AniFree/components/carousel.dart';
import 'package:AniFree/components/custom_appbar.dart';
import 'package:AniFree/components/recent_anime.dart';
import 'package:AniFree/constants.dart';

class AnimeHome extends StatelessWidget {
  static String id = 'anime_screen';
  final List recent_anime_names;
  final List recent_anime_images;
  final List recent_anime_episodes;
  final List recent_anime_links;
  final List popular_anime_names;
  final List popular_anime_links;
  final List popular_anime_images;
  AnimeHome({this.recent_anime_names,this.recent_anime_images,this.recent_anime_episodes,this.recent_anime_links,this.popular_anime_images,this.popular_anime_links,this.popular_anime_names});  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
            child: Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                //color: Colors.red,
                height: 45,
                child: CustomAppBar()
              ),
              Container(
                //color: Colors.green,
                height: 380,
                child: Carousel(imgList: popular_anime_images,animeLinks: popular_anime_links,animeNames: popular_anime_names)
              ),
              Expanded(
                child: RecentAnime(animeNames: recent_anime_names,imgList: recent_anime_images,episodes: recent_anime_episodes,links: recent_anime_links)
              )
            ],
          ),
        ),
      ),
    );
  }
}