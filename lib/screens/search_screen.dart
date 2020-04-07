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
  List animeLinks = [];
  List animeNames = [];
  void searchAnime(value) async {
    imgLinks.clear();
    animeLinks.clear();
    animeNames.clear();
    searchData = await fetch(HOME + '/search?search=' + value);
    try {
      decodedSearchData = jsonDecode(searchData);
      for (var item in decodedSearchData) {
        imgLinks.add(item['image_link']);
        animeLinks.add(item['link']);
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
                        }
                        else{
                          setState(() {
                            bodyText = "Oops, you forgot to type!";
                          });
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hasFloatingPlaceholder: true,
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: 'Enter anime to search',
                          hintStyle: TextStyle(color: Colors.white30),
                          filled: true,
                          fillColor: appBarColor),
                      style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.white),
                    )),
                Expanded(
                  child: !searchCompleted
                      ? Container(
                          color: backgroundColor,
                          child: Center(
                            child: Text(bodyText, style: cardTextStyle.copyWith(fontWeight: FontWeight.w400)),
                          ),
                        )
                      : GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          children: List.generate(imgLinks.length, (index) {
                            return Container(
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AboutAnime(
                                              animeLink: animeLinks[index],
                                              animeName: animeNames[index],
                                              imageLink: imgLinks[index])));
                                },
                                padding: EdgeInsets.zero,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Expanded(
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        elevation: 5.0,
                                        child: Hero(
                                          tag: imgLinks[index],
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Image.network(
                                                imgLinks[index],
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          animeNames[index].toString().length <=
                                                  23
                                              ? animeNames[index]
                                              : animeNames[index]
                                                      .toString()
                                                      .substring(0, 24) +
                                                  '..',
                                          style: cardTextStyle,
                                        ),
                                      ),
                                    )
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
