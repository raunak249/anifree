import 'package:AniFree/screens/episodes_page.dart';
import 'package:AniFree/screens/search_screen.dart';
import 'package:AniFree/screens/watch_screen.dart';
import 'package:flutter/material.dart';
import 'package:AniFree/screens/anime_home.dart';
import 'package:AniFree/screens/splashscreen.dart';
import 'package:AniFree/screens/about_anime.dart';
import 'package:AniFree/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat',unselectedWidgetColor: lightFont),
      debugShowCheckedModeBanner: false,
      initialRoute : SplashScreen.id,
      routes: {
        AnimeHome.id : (context) => AnimeHome(),
        SplashScreen.id : (context) => SplashScreen(),
        AboutAnime.id : (context) => AboutAnime(),
        EpisodesPage.id : (context) => EpisodesPage(),
        WatchScreen.id : (context) => WatchScreen(),
        SearchScreen.id : (context) => SearchScreen()
      },
    );
  }
}