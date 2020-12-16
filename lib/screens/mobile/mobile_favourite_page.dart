import 'dart:convert';

import 'package:app/model/models.dart';
import 'package:app/widgets/fav_item.dart';
import 'package:app/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MobileFavouritePage extends StatefulWidget {
  @override
  _MobileFavouritePageState createState() => _MobileFavouritePageState();
}

class _MobileFavouritePageState extends State<MobileFavouritePage> {
    List<Post> _posts = <Post>[];


  Future<List<Post>> fetchPost() async {
    var url = 'http://10.0.2.2:8000/api';
    var response = await http.get(url);
    var posts = <Post>[];
    if (response.statusCode == 200) {
      var postsJson = jsonDecode(response.body);
      for (var postJson in postsJson) {
        posts.add(Post.fromJson(postJson));
      }
    } else {
      print("issue");
    }
    return posts;
  }

  @override
  void initState() {
    fetchPost().then((value) {
      setState(() {
        _posts.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, position) {
            return PostContainer(post: _posts[position],);
            // return Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: Text(
            //       position.toString(),
            //       style: TextStyle(fontSize: 22.0),
            //     ),
            //   ),
            // );
          },
        );
  }
}
