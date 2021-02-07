import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class XetiaBottomNavBar extends StatelessWidget {
  final Function onTap;
  final int page;

  const XetiaBottomNavBar({Key key, this.onTap, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(
          page == 0 ? Icons.home : Icons.home_outlined,
          size: page == 0 ? 30 : 24,
          color: page == 0 ? Colors.white : kGrey,
        ),
        Icon(
          page == 1 ? Icons.favorite : Icons.favorite_border,
          size: page == 1 ? 30 : 24,
          color: page == 1 ? Colors.white : kGrey,
        ),
        Icon(
          page == 2 ? Icons.shop : Icons.shop_outlined,
          size: page == 2 ? 30 : 24,
          color: page == 2 ? Colors.white : kGrey,
        ),
        Icon(
          page == 3 ? Icons.settings : Icons.settings_outlined,
          size: page == 3 ? 30 : 24,
          color: page == 3 ? Colors.white : kGrey,
        ),
      ],
      backgroundColor: Colors.transparent,
      color: kOrange,
      buttonBackgroundColor: kOrange,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      onTap: onTap,
      letIndexChange: (index) => true,
    );
  }
}
