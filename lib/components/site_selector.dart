import 'package:flutter/material.dart';
import 'package:AniFree/constants.dart';
import 'package:AniFree/screens/watch_screen.dart';

class SiteSelector extends StatefulWidget {
  final String animeName;
  SiteSelector({this.animeName});
  @override
  _SiteSelectorState createState() => _SiteSelectorState();
}

class _SiteSelectorState extends State<SiteSelector> {
  int siteSelected;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        backgroundColor: cardColor,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 20.0,
        content: StatefulBuilder(
          builder: (context,setState) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text('AnimeKisa',style: cardTextStyle),
                leading: Radio(
                    value: 1,
                    groupValue: siteSelected,
                    onChanged: (value) {
                      setState(() {
                        siteSelected = value;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WatchScreen(animeName: widget.animeName,siteSelected: siteSelected)));
                      });
                    }),
              ),
              ListTile(
                title: Text('4Anime',style: cardTextStyle),
                leading: Radio(
                    value: 2,
                    groupValue: siteSelected,
                    onChanged: (value) {
                      setState(() {
                        siteSelected = value;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WatchScreen(animeName: widget.animeName,siteSelected: siteSelected)));
                      });
                    }),
              ),
              ListTile(
                title: Text('GoGoAnime',style: cardTextStyle),
                leading: Radio(
                    value: 3,
                    groupValue: siteSelected,
                    onChanged: (value) {
                      setState(() {
                        siteSelected = value;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WatchScreen(animeName: widget.animeName,siteSelected: siteSelected,)));
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}