import 'package:AniFree/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:AniFree/components/site_selector.dart';

class AboutAnime extends StatefulWidget {
  static String id = 'about_anime';
  final String animeName;
  final String animeDesc;
  final String imageLink;
  AboutAnime({this.animeDesc, this.imageLink, this.animeName});

  @override
  _AboutAnimeState createState() => _AboutAnimeState();
}

class _AboutAnimeState extends State<AboutAnime> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      body: SafeArea(
          child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Hero(
                    tag: widget.imageLink,
                    child: Container(
                      height: 500,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                          image: NetworkImage(widget.imageLink),
                          fit: BoxFit.fill,
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
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.animeName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 23,
                            color: lightFont,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.animeDesc,
                        textAlign: TextAlign.center,
                        style: subTitleStyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: lightFont),
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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SiteSelector(animeName: widget.animeName);
                      });
                },
                child: Container(
                  color: Color(0xffF4717F),
                  alignment: Alignment.center,
                  child: Text(
                    'WATCH NOW',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        wordSpacing: 3,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}


