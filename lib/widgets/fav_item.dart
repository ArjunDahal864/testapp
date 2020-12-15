
import 'package:app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class FavItem extends StatelessWidget {
  final String url;
  final String title;
  final String description;

  const FavItem({ required this.url,  required this.title, required this.description})
      ;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileAvatar(imageUrl : url ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(description,
                      style: TextStyle(color: Colors.grey[400], fontSize: 16))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
