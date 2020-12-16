import 'dart:convert';

// import 'package:app/data/data.dart';
import 'package:app/model/models.dart';
import 'package:app/widgets/post.dart';
// import 'package:app/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MobileHomePage extends StatefulWidget {
  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
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
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        // child: Text(_posts[0].caption.toString()),
        child: CustomScrollView(
            slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  // print(index);
                  final Post post = _posts[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: PostContainer(post: post),
                  );
                }, childCount: _posts.length)),
                // Text(_posts.toString())
            ],
            ),
      )),
    );
  }
}
