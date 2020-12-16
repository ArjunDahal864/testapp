import 'package:app/data/data.dart';
import 'package:app/model/post_model.dart';
import 'package:app/widgets/post.dart';
import 'package:app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class DesktopHomePage extends StatelessWidget {
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
            body: CustomScrollView(
              // slivers: [
              //   SliverList(
              //       delegate: SliverChildBuilderDelegate((context, index) {
              //     // print(index);
              //     final Post post = posts[index];
              //     return Padding(
              //       padding: const EdgeInsets.only(top: 8.0),
              //       child: PostContainer(post: post),
              //     );
              //   }, childCount: posts.length))
              // ],
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
