import 'package:app/widgets/fav_item.dart';
import 'package:flutter/material.dart';

class MobileFavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
ListView.builder(
          itemCount: 20,
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FavItem(
                description: "some desc",
                title: "some ot",
                url: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              ),
            );
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
