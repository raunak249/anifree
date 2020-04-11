import 'package:AniFree/constants.dart';
import 'package:flutter/material.dart';
import 'package:AniFree/api/api.dart';
import 'dart:convert';
import 'package:AniFree/screens/about_anime.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool searchCompleted = false;
  bool loading = false;
  String bodyText = "It's lonely in here.";
  var searchData;
  var decodedSearchData;
  List imgLinks = [];
  List animeDesc = [];
  List animeNames = [];
  void searchAnime(value) async {
    imgLinks.clear();
    animeDesc.clear();
    animeNames.clear();
    searchData = await fetch(HOME + '/search?search=' + value);
    try {
      decodedSearchData = jsonDecode(searchData);
      for (var item in decodedSearchData) {
        imgLinks.add(item['image_link']);
        animeDesc.add(item['description']);
        animeNames.add(item['name']);
      }
      searchCompleted = true;
    } catch (e) {
      bodyText = "Sorry, couldn't find anything.";
      searchCompleted = false;
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: loading,
          child: Container(
            color: backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 55,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: TextField(
                      onSubmitted: (value) {
                        if (value.length != 0) {
                          setState(() {
                            searchCompleted = false;
                            loading = true;
                          });
                          searchAnime(value);
                        } else {
                          setState(() {
                            bodyText = "Oops, you forgot to type!";
                          });
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: FlatButton(
                            padding: EdgeInsets.zero,
                            child: Icon(Icons.arrow_back,color: iconColor),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          suffixIcon: FlatButton(
                            padding: EdgeInsets.zero,
                            child: Icon(Icons.search,color: iconColor),
                            onPressed: (){},
                          ),
                          hasFloatingPlaceholder: true,
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: 'Enter anime to search',
                          hintStyle: TextStyle(color: darkFont),
                          filled: true,
                          fillColor: appBarColor),
                      style:
                          TextStyle(fontFamily: 'Montserrat', color: lightFont),
                    )),
                Expanded(
                  child: !searchCompleted
                      ? Container(
                          color: backgroundColor,
                          child: Center(
                            child: Text(bodyText,
                                style: cardTextStyle.copyWith(
                                    fontWeight: FontWeight.w400)),
                          ),
                        )
                      : GridView.count(
                          childAspectRatio: 5/9,
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 6,
                          children: List.generate(imgLinks.length, (index) {
                            return Container(
                              color: backgroundColor,
                              child: FlatButton(
                                color: backgroundColor,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AboutAnime(
                                              animeDesc: animeDesc[index],
                                              animeName: animeNames[index],
                                              imageLink: imgLinks[index])));
                                },
                                padding: EdgeInsets.zero,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: backgroundColor,
                                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 5,
                                              child: Hero(
                                                tag: imgLinks[index],
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(topLeft: Radius.circular(20) ,topRight: Radius.circular(20)),
                                                  child: Image.network(
                                                      imgLinks[index],
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: cardColor,
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))),
                                                child: Center(
                                                  child: Text(
                                                    animeNames[index]
                                                                .toString()
                                                                .length <=
                                                            23
                                                        ? animeNames[index]
                                                        : animeNames[index]
                                                                .toString()
                                                                .substring(
                                                                    0, 24) +
                                                            '..',
                                                    style: cardTextStyle.copyWith(color: lightFont),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
