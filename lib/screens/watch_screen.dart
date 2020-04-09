import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchScreen extends StatelessWidget {
  WebViewController controller;
  static String id = 'watch_screen';
  final String animeName;
  WatchScreen({this.animeName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
          child: WebView(
            initialUrl: 'https://animekisa.tv/search?q='+animeName,
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