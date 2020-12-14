import 'package:app/screens/desktop/desktop.dart';
import 'package:app/screens/tablet/tablet.dart';
import 'package:app/screens/mobile/mobile.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
          desktop: DesktopHomePage(),
          mobile: MobileHomePage(),
          tablet: TabletHomePage(),        
        );
  }
}