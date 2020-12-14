import 'package:app/data/data.dart';
import 'package:app/model/models.dart';
import 'package:app/widgets/post.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: CustomScrollView(
        slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              // print(index);
              final Post post = posts[index];
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: PostContainer(post: post),
              );
            }, childCount: posts.length))
        ],
      ),
          )),
    );
  }
}
