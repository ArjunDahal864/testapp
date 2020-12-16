import 'package:app/model/models.dart';
import 'package:app/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
        elevation: isDesktop ? 5.0 : 0.0,
        shape: isDesktop
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
            : null,
        margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(
                  height: 4.0,
                ),
                Text(post.caption,style: TextStyle(fontSize: 18),),
                // ignore: unnecessary_null_comparison
                post.image != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0),
                // ignore: unnecessary_null_comparison
                post.image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CachedNetworkImage(imageUrl: post.image),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: _PostStats(post: post),
                )
              ],
            ),
          ),
        ));
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.author.username,
                style: Responsive.isTablet(context)
                    ? TextStyle(fontWeight: FontWeight.w600, fontSize: 30)
                    : Responsive.isMobile(context)
                        ? TextStyle(fontWeight: FontWeight.w600)
                        : TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print("pressed"),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const Icon(Icons.favorite, size: 10.0, color: Colors.red),
            ),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              "${post.shares} Shares",
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  Icons.favorite_sharp,
                  color: Colors.red[600],
                  size: 30.0,
                ),
                onTap: () => print("pressed")),
            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 30.0,
                ),
                onTap: () => print("pressed")),
            _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 30.0,
                ),
                onTap: () => print("pressed")),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  // final String lable;
  final Function onTap;

  const _PostButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        // onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 01.0,
                ),
              ],
            )),
      ),
    );
  }
}
