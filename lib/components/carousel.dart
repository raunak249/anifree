import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  //TODO Add functionality to get images from api
  List imgList = ['assets/image1.jpg','assets/image2.jpg','assets/image3.jpg'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        initialPage: 0,
        onPageChanged: (index){
          setState(() {
            _current = index;
          });
        },
        items: imgList.map((imgUrl){
          return Builder(
            builder: (context){
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(image: AssetImage(imgUrl),fit: BoxFit.fitWidth)
                ),
              );
            });
        }).toList()
      ),    
    );
  }
}