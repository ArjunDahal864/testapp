import 'package:flutter/material.dart';

class FavItem extends StatelessWidget {
  final String title;
  final String author;
  final String time;

  const FavItem({this.title, this.author, this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
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
                  Text(author,
                      style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                  Text(time,
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
