import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class CustomCurvedNavBar extends StatelessWidget {
  final Function onTap;
  final Function onDoubleTap;
  final List<NavBarItem> items;
  final int page;

  CustomCurvedNavBar(
      {Key key, this.onTap, this.page, this.onDoubleTap, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: CurvedNavigationBar(
        index: page,
        height: 50.0,
        items: List.generate(
          items.length,
          (index) => Icon(
            page == index
                ? items[index].selectedIcon
                : items[index].unselectedIcon,
            size: page == index ? 30 : 24,
            color: page == index ? Colors.white : kGrey,
          ),
        ),
        backgroundColor: Colors.transparent,
        color: kOrange,
        buttonBackgroundColor: kOrange,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: onTap,
        letIndexChange: (index) => true,
      ),
    );
  }
}

class NavBarItem {
  final IconData selectedIcon;
  final IconData unselectedIcon;

  NavBarItem(this.selectedIcon, this.unselectedIcon);
}
