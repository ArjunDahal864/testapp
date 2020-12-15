import 'package:app/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({ required this.icons, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: Responsive.isDesktop(context) ? EdgeInsets.all(8): EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Responsive.isMobile(context) ? Border(bottom: BorderSide(color:Colors.redAccent,width: 2) ): null),
      tabs: icons
      .asMap()
      .map((i, e) => MapEntry(i, Tab(icon: Icon(e,color: i == selectedIndex ? Colors.redAccent:Colors.black45,size: 30,),)))
      .values
      .toList(),
      onTap: onTap,
    );
  }
}