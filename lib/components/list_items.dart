import 'package:flutter/material.dart';
import 'package:AniFree/screens/watch_screen.dart';
import 'package:AniFree/components/info_card.dart';

class ListItems extends StatelessWidget {
  final List imgList;
  final List links;
  final List animeNames;
  final List episodes;

  ListItems({this.imgList,this.links,this.animeNames,this.episodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: imgList.length,
    itemBuilder: (context,index){
      return FlatButton(
          padding: EdgeInsets.zero,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => WatchScreen(episodeLink: links[index])));
          },
          child: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: InfoCard(
            img:imgList[index],
            duration: '23m',
            title: animeNames[index],
            episode: episodes[index],
          ),
        ),
      );
    },
    );
  }
}