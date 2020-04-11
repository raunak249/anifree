import 'package:AniFree/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:AniFree/screens/about_anime.dart';

class Carousel extends StatefulWidget {
  final List imgList;
  final List animeNames;
  final List animeDesc;
  final List animeScore;
  Carousel({this.imgList, this.animeDesc, this.animeNames, this.animeScore});
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(top: 15.0),
      child: CarouselSlider(
          viewportFraction: 0.65,
          enlargeCenterPage: true,
          height: 400,
          initialPage: 0,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          items: widget.imgList.asMap().entries.map((entry) {
            return Builder(builder: (context) {
              return FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutAnime(
                              animeName: widget.animeNames[entry.key],
                              animeDesc: widget.animeDesc[entry.key],
                              imageLink: entry.value)));
                },
                padding: EdgeInsets.zero,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  color: backgroundColor,
                  child: Hero(
                    tag: entry.value,
                    child: Card(
                      elevation: 3,
                      color: cardColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Expanded(
                                    flex: 5,
                                    child: Image.network(entry.value,
                                        fit: BoxFit.fill)),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            widget.animeNames[entry.key],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: lightFont),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: CircleAvatar(
                                              backgroundColor: splashSceenColor,
                                              child: Text(
                                                widget.animeScore[entry.key]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.0,
                                                    color: lightFont),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              );
            });
          }).toList()),
    );
  }
}
