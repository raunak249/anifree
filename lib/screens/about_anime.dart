import 'package:AniFree/constants.dart';
import 'package:flutter/material.dart';
import 'package:AniFree/api/api.dart';
import 'package:AniFree/screens/episodes_page.dart';
import 'dart:convert';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AboutAnime extends StatefulWidget {
  static String id = 'about_anime';
  final String animeLink;
  final String imageLink;
  AboutAnime({this.animeLink,this.imageLink});

  @override
  _AboutAnimeState createState() => _AboutAnimeState();
}

class _AboutAnimeState extends State<AboutAnime> {
  bool isLoading = false;
  String desc = '';
  List categories = [];
  List episodeLinks = [];
  List episodeNames = [];
  var animeInfo;
  var animeInfoDecoded;
  void getAnimeDesc(url) async {
    isLoading = true;
    animeInfo = await fetch(HOME + '/anime_info?url=' + url);
    animeInfoDecoded = jsonDecode(animeInfo);
    desc = animeInfoDecoded['desc'];
    categories = animeInfoDecoded['categories'];
    episodeLinks = animeInfoDecoded['episode_links'];
    episodeNames = animeInfoDecoded['episode_names'];
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    getAnimeDesc(widget.animeLink);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child : ModalProgressHUD(
          inAsyncCall: isLoading,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                  tag: widget.imageLink,
                  child: Container(
                    height: 400,
                    child: Image(
                    image: NetworkImage(widget.imageLink),
                    fit: BoxFit.cover,
                    ),
                  ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  color: backgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Synopsis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      )
                      ),
                      SizedBox(height: 20),
                      Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: subTitleStyle.copyWith(
                          fontSize:16.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500
                        ),
                        ),
                    ],
                  ),
                      ),
                    ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EpisodesPage(episodeLinks: episodeLinks,episodeNames: episodeNames)));
                    },
                    child: Container(
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: Text(
                      'WATCH NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        wordSpacing: 3,
                        letterSpacing: 1.5
                      ),
                    ),
                  ),
                ),
              )
            ],

          ),
        ) 
      ),
    );
  }
}