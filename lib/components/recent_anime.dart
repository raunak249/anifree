import 'package:AniFree/screens/watch_screen.dart';
import 'package:flutter/material.dart';
import 'package:AniFree/components/info_card.dart';
import 'package:AniFree/constants.dart';

class RecentAnime extends StatefulWidget {
  final List imgList;
  final List animeNames;
  final List episodes;
  final List links;
  RecentAnime({this.imgList,this.animeNames,this.episodes,this.links});

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
                        color : Colors.white38,
                        fontWeight: FontWeight.w200
                        ),
                      )
                    ],
                  ),
                ) 
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.imgList.length,
            itemBuilder: (context,index){
              return FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WatchScreen(episodeLink: widget.links[index])));
                  },
                  child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: InfoCard(
                    img:widget.imgList[index],
                    duration: '23m',
                    title: widget.animeNames[index],
                    episode: widget.episodes[index],
                  ),
                ),
              );
            },
            ),
          )
          //InfoCard(img: 'assets/image1.jpg',duration: '23m',title: 'MOB PSYCHO 100'),
          //InfoCard()
        ],
      ),
    );
  }
}