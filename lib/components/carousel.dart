import 'package:AniFree/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  List imgList;
  List animeNames;
  List animeLinks;
  Carousel({this.imgList,this.animeLinks,this.animeNames});
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
        onPageChanged: (index){
          setState(() {
            _current = index;
          });
        },
        items: widget.imgList.asMap().entries.map((entry){
          return Builder(
            builder: (context){
              return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              color: backgroundColor,
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(entry.value),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Container(
                        child: Text(
                          widget.animeNames[entry.key],
                          style: TextStyle(
                            shadows: [Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black,
                                          offset: Offset(5.0, 5.0),
                                          ),
                                      ],
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.white
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      ),
                    )
                ),
              ),
            );
            });
        }).toList()
      ),    
    );
  }
}