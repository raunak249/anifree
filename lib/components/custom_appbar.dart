import 'package:flutter/material.dart';
import 'package:AniFree/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarColor,
      padding: EdgeInsets.symmetric(vertical:3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                  color: iconColor,
                  ), 
                onPressed: (){
                  //TODO Add Search Functionality
                }
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Container(
              child: Text(
                'Discover',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                  color: iconColor
                ),
                ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.account_circle,
                  size: 30.0,
                  color: iconColor,
                ),
                onPressed: (){
                  //TODO Account button functionality
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}