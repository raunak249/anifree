import 'package:AniFree/constants.dart';
import 'package:flutter/material.dart';
import 'package:AniFree/api/api.dart';
import 'package:AniFree/screens/episodes_page.dart';
import 'dart:convert';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AboutAnime extends StatefulWidget {
  static String id = 'about_anime';
  final String animeName;
  final String animeLink;
  final String imageLink;
  AboutAnime({this.animeLink,this.imageLink,this.animeName});

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
              Expanded(
                    flex : 6,
                    child: Container(
                      margin: EdgeInsets.only(top : 20.0,left: 20.0,right: 20.0),
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        child: Hero(
                        tag: widget.imageLink,
                        child: Container(
                          height: 500,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image(
                            image: NetworkImage(widget.imageLink),
                            fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                      ),
                    ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.animeName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: subTitleStyle.copyWith(
                          fontSize:16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        ),
                    ],
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