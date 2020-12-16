import 'package:app/screens/favourite_page.dart';
import 'package:app/screens/home_page.dart';
import 'package:app/screens/notification_page.dart';
import 'package:app/screens/profile_page.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'search_page.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomePage(),
    FavouritePage(),
    SearchPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  final List<IconData> _icons = const [
    MdiIcons.home,
    Icons.favorite,
    Icons.search,
    MdiIcons.bell,
    Icons.person,
    // Icons.
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: Responsive.isDesktop(context)
              ? PreferredSize(
                  preferredSize: Size(screenSize.width, 100.0),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    color: Colors.white,
                    child: CustomTabBar(
                      icons: _icons,
                      selectedIndex: _selectedIndex,
                      onTap: (index) => setState(() => _selectedIndex = index),
                    ),
                  ),
                )
              : null,
          body: IndexedStack(
            children: _screens,
            index: _selectedIndex,
          ),
          bottomNavigationBar: Responsive.isMobile(context)
              ? Container(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  color: Colors.white,
                  child: CustomTabBar(
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => setState(() => _selectedIndex = index),
                  ),
                )
              : Responsive.isTablet(context)
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      color: Colors.white,
                      child: CustomTabBar(
                        icons: _icons,
                        selectedIndex: _selectedIndex,
                        onTap: (index) =>
                            setState(() => _selectedIndex = index),
                      ),
                    )
                  : null,
        ));
  }
}
