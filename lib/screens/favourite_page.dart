import 'package:app/screens/desktop/desktop.dart';
import 'package:app/screens/mobile/mobile_favourite_page.dart';
import 'package:app/screens/tablet/tablet_favourite_page.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileFavouritePage(),
      desktop: DesktopFavouritePage(),
      tablet: TabletFavouritePage(),
    );
  }
}