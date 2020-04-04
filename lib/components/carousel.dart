import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  //TODO Add functionality to get images from api
  List imgList = ['assets/image1.jpg','assets/image2.jpg','assets/image3.jpg','assets/image4.jpg','assets/image5.jpg'];

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
        items: imgList.map((imgUrl){
          return Builder(
            builder: (context){
              //TODO ADD shadow to the carousel
              return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.green,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(image: AssetImage(imgUrl),fit: BoxFit.cover)
              ),
                );
            });
        }).toList()
      ),    
    );
  }
}