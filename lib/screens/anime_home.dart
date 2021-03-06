import 'package:AniFree/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:AniFree/components/carousel.dart';
import 'package:AniFree/components/custom_appbar.dart';
import 'package:AniFree/components/recent_anime.dart';
import 'package:AniFree/constants.dart';

class AnimeHome extends StatelessWidget {
  static String id = 'anime_screen';
  final List recentAnimeNames;
  final List recentAnimeImages;
  final List recentAnimeEpisodes;
  final List recentAnimeDesc;
  final List popularAnimeNames;
  final List popularAnimeDesc;
  final List popularAnimeScore; 
  final List popularAnimeImages;
  final List recentAnimeTimeUntilNext;
  AnimeHome(
      {this.recentAnimeNames,
      this.recentAnimeImages,
      this.recentAnimeEpisodes,
      this.recentAnimeDesc,
      this.popularAnimeImages,
      this.popularAnimeDesc,
      this.popularAnimeNames,
      this.recentAnimeTimeUntilNext,
      this.popularAnimeScore});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  //color: Colors.red,
                  height: 50,
                  child: CustomAppBar()),
              Container(
                  //color: Colors.green,
                  height: 380,
                  child: Carousel(
                      imgList: popularAnimeImages,
                      animeDesc: popularAnimeDesc,
                      animeNames: popularAnimeNames,
                      animeScore: popularAnimeScore,
                  )
              ),
              Expanded(
                  child: RecentAnime(
                      animeNames: recentAnimeNames,
                      imgList: recentAnimeImages,
                      episodes: recentAnimeEpisodes,
                      timeUntilNext: recentAnimeTimeUntilNext,)
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: sideBarColor,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                    color: Colors.white,
                    child: Image.asset('assets/header.jpg', fit: BoxFit.fill))),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: Icon(Icons.search, color: iconColor),
                title: Text('Search', style: cardTextStyle),
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
