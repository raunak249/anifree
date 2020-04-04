import 'package:flutter/material.dart';
import 'package:AniFree/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30.0,
              color: iconColor,
              ), 
            onPressed: (){
              //TODO Add Search Functionality
            }
          ),
          Container(
            child: Text(
              'Discover',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                color: iconColor
              ),
              ),
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30.0,
              color: iconColor,
            ),
            onPressed: (){
              //TODO Account button functionality
            }
          )
        ],
      ),
    );
  }
}