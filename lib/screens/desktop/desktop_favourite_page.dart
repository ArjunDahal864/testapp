import 'dart:convert';

import 'package:app/data/data.dart';
import 'package:app/model/favourite.dart';
import 'package:app/model/post_model.dart';
import 'package:app/widgets/fav_item.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DesktopFavouritePage extends StatefulWidget {
  @override
  _DesktopFavouritePageState createState() => _DesktopFavouritePageState();
}

class _DesktopFavouritePageState extends State<DesktopFavouritePage> {
  List<Favourite> _favs = <Favourite>[];

  Future<List<Favourite>> fetchPost() async {
    var url = 'http://127.0.0.1:8000/api/fav/';
    var response = await http.get(url);
    var favs = <Favourite>[];
    if (response.statusCode == 200) {
      var postsJson = jsonDecode(response.body);
      for (var postJson in postsJson) {
        favs.add(Favourite.fromJson(postJson));
      }
    } else {
      print("issue");
    }
    return favs;
  }

  @override
  void initState() {
    fetchPost().then((value) {
      setState(() {
        _favs.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(),
              ),
            )),
        const Spacer(),
        Container(
          width: 700,
          child: Scaffold(
            body: ListView.builder(
              itemCount: _favs.length,
              itemBuilder: (context, position) {
                return FavItem(
                  title: _favs[position].caption,
                  time: _favs[position].time,
                  author: _favs[position].author.username,
                );
              },
            ),
          ),
        ),
        Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Column(
                    children: [_RightSideCard()],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class _RightSideCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileAvatar(
                imageUrl:
                    "https://images.unsplash.com/photo-1607931423391-d25b0b2d4c42?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1200&q=60"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("data"),
                const SizedBox(
                  height: 5,
                ),
                Text("data")
              ],
            ),
          )
        ],
      ),
    );
  }
}
