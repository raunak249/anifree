import 'package:flutter/material.dart';
import 'package:AniFree/api/api.dart';
import 'dart:convert';
import 'package:AniFree/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class WatchScreen extends StatefulWidget {
  static String id = 'watch_screen';
  final String episodeLink;
  

  WatchScreen({this.episodeLink});

  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  var videoLinkData;
  bool isLoading = false;
  var decodedVideoLinkData;

  String videoLink = '';

  void getAnime(url) async {
    isLoading = true;
    videoLinkData = await fetch(HOME + '/video_link?url=https://animekisa.tv' + url);
    decodedVideoLinkData = jsonDecode(videoLinkData);
    videoLink = decodedVideoLinkData['video_link'];
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    getAnime(widget.episodeLink);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
               child : Text(videoLink)
      ),
    );
  }
}