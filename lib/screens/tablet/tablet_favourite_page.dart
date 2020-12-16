import 'dart:convert';

import 'package:app/model/models.dart';
import 'package:app/widgets/fav_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TabletFavouritePage extends StatefulWidget {
  @override
  _TabletFavouritePageState createState() => _TabletFavouritePageState();
}

class _TabletFavouritePageState extends State<TabletFavouritePage> {
   List<Favourite> _favs = <Favourite>[];

  Future<List<Favourite>> fetchPost() async {
    var url = 'http://10.0.2.2:8000/api/fav/';
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
    return ListView.builder(
      itemCount: _favs.length,
      itemBuilder: (context, position) {
        return FavItem(
          title: _favs[position].caption,
          time: _favs[position].time,
          author: _favs[position].author.username,
        );
      },
    );
  }
}