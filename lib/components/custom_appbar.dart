import 'package:flutter/material.dart';
import 'package:AniFree/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Card(
          elevation: 5,
          color: appBarColor,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 30.0,
                    color: iconColor,
                    ), 
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  }
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Anifree',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: lightFont
                  ),
                  ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}