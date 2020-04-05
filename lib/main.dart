import 'package:flutter/material.dart';
import 'package:AniFree/screens/anime_home.dart';
import 'package:AniFree/screens/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute : SplashScreen.id,
      routes: {
        AnimeHome.id : (context) => AnimeHome(),
        SplashScreen.id : (context) => SplashScreen()
      },
    );
  }
}