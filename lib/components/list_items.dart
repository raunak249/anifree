import 'package:flutter/material.dart';
import 'package:AniFree/components/info_card.dart';
import 'package:AniFree/components/site_selector.dart';

class ListItems extends StatelessWidget {
  final List imgList;
  final List animeNames;
  final List episodes;
  final List timeUntilNext;

  ListItems({this.imgList,this.animeNames,this.episodes,this.timeUntilNext});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: imgList.length,
    itemBuilder: (context,index){
      return FlatButton(
          padding: EdgeInsets.zero,
          onPressed: (){
            showDialog(
                      context: context,
                      builder: (context) {
                        return SiteSelector(animeName: animeNames[index]);
                      });
          },
          child: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: InfoCard(
            img:imgList[index],
            duration: '23m',
            timeUntilNext: timeUntilNext[index],
            title: animeNames[index],
            episode: episodes[index].toString(),
          ),
        ),
      );
    },
    );
  }
}