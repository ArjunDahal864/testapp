import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar(
      {
      required this.imageUrl,
      })
     ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        
      ],
    );
  }
}