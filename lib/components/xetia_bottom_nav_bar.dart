import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class XetiaBottomNavBar extends StatelessWidget {
  final Function onTap;

  const XetiaBottomNavBar({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.flip,
      backgroundColor: kOrange,
      color: kGrey,
      activeColor: Colors.white,
      items: [
        TabItem(
            icon: Icons.home_outlined, title: 'Home', activeIcon: Icons.home),
        TabItem(
            icon: Icons.favorite_border,
            title: 'Discovery',
            activeIcon: Icons.favorite),
        TabItem(
            icon: Icons.shop_outlined, title: 'Add', activeIcon: Icons.shop),
      ],
      onTap: onTap,
    );
  }
}
