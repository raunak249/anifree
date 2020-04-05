import 'package:AniFree/constants.dart';
import 'package:AniFree/screens/watch_screen.dart';
import 'package:flutter/material.dart';

class EpisodesPage extends StatelessWidget {
  static String id = 'episode_page';
  final List episodeLinks;
  final List episodeNames;
  EpisodesPage({this.episodeLinks,this.episodeNames});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                  child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: episodeLinks.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 80,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WatchScreen(episodeLink: episodeLinks[index])));
                        },
                        padding: EdgeInsets.zero,
                        child: Card(
                          child: Center(
                            child: Text(
                              'Episode ' + episodeNames[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      )
                    );
                  },
      ),
                ),
              ),
    );
  }
}