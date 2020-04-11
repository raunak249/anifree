import 'package:AniFree/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchScreen extends StatelessWidget {
  WebViewController controller;
  final int siteSelected;
  String URL;
  static String id = 'watch_screen';
  final String animeName;
  WatchScreen({this.animeName,this.siteSelected=1});
  @override
  Widget build(BuildContext context) {
    switch (siteSelected) {
      case 1:
        URL = 'https://animekisa.tv/search?q=';
        break;
      case 2:
        URL = 'https://4anime.to/?s=';
        break;
      default:
        URL = 'https://www.gogoanime.io//search.html?keyword=';
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF4717F),
          leading: FlatButton(
            padding: EdgeInsets.zero,
            onPressed: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back,color: Colors.white)
            ),
          title: Text(animeName,style: TextStyle(color: lightFont)),
        ),
        body: SafeArea(
          child: Container(
          child: WebView(
            initialUrl: URL+animeName,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webviewcontroller) {
              controller = webviewcontroller;
            },
          ),
      ),
        ),
    );
  }
}