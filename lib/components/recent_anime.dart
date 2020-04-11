import 'package:flutter/material.dart';
import 'package:AniFree/constants.dart';
import 'package:AniFree/components/list_items.dart';

class RecentAnime extends StatefulWidget {
  final List imgList;
  final List animeNames;
  final List episodes;
  final List timeUntilNext;
  RecentAnime({this.imgList,this.animeNames,this.episodes,this.timeUntilNext});

  @override
  _RecentAnimeState createState() => _RecentAnimeState();
}

class _RecentAnimeState extends State<RecentAnime> {
  @override
  Widget build(BuildContext context) {
    // print(widget.imgList);
    // print(widget.animeNames);
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Discover',
                        style: mainTitleStyle,
                      ),
                      Text(
                        'Recently added anime',
                        style:TextStyle(
                        fontWeight: FontWeight.w200,
                        color: lightFont
                        ),
                      )
                    ],
                  ),
                ) 
              ],
            ),
          ),
          Expanded(
            child: ListItems(imgList: widget.imgList,animeNames: widget.animeNames,episodes: widget.episodes,timeUntilNext: widget.timeUntilNext)
          )
          //InfoCard(img: 'assets/image1.jpg',duration: '23m',title: 'MOB PSYCHO 100'),
          //InfoCard()
        ],
      ),
    );
  }
}

