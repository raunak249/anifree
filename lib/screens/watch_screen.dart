import 'package:flutter/material.dart';
import 'package:AniFree/api/api.dart';
import 'dart:convert';
import 'package:AniFree/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class WatchScreen extends StatefulWidget {
  static String id = 'watch_screen';
  final String episodeLink;
  

  WatchScreen({this.episodeLink});

  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  var videoLinkData;
  bool isLoading = true;
  var decodedVideoLinkData;
  VideoPlayerController controller;
  ChewieController chewieController;

  String videoLink = '';

  void getAnime(url) async {
    videoLinkData = await fetch(HOME + '/video_link?url=' + url);
    decodedVideoLinkData = jsonDecode(videoLinkData);
    videoLink = decodedVideoLinkData['video_link'];
    initVideoController(videoLink);
  }

  void initVideoController(videoLink){
    controller = VideoPlayerController.network(videoLink);
    
    chewieController = ChewieController(
    videoPlayerController: controller,
    aspectRatio: 3 / 2,
    autoPlay: true,
    looping: true,
    );
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
  void dispose() {
  controller.dispose();
  chewieController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
         child : isLoading ? Container(
           color: backgroundColor,
           child: Center(
             child: CircularProgressIndicator()
             )
          ):Chewie(
            controller: chewieController,
          )
      );
  }
}