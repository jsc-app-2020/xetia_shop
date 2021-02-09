import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xetia_shop/components/custom_curved_nav_bar.dart';
import 'package:xetia_shop/components/draggable_fab.dart';
import 'package:xetia_shop/core/provider/ThemeProvider.dart';

import 'cart_screens/cart_screen.dart';
import 'dashboard_screens/dashboard_screen.dart';
import 'favorite_screens/favorite_screen.dart';
import 'setting_screens/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  static const name = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  List<Widget> bodies;

  @override
  void initState() {
    super.initState();
    bodies = [
      DashboardScreen(),
      FavoriteScreen(),
      CartScreen(),
      SettingScreen(),
    ];
  }

  List<Widget> bodyList(bool isDark) => [
        DashboardScreen(isDark: isDark),
        FavoriteScreen(),
        CartScreen(),
        SettingScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDark;
    print("mode gelap $isDark");
    return Scaffold(
      body: Stack(
        children: [
          bodyList(isDark)[page],
          XetiaBottomNavBar(
            onTap: (value) {
              setState(() {
                page = value;
              });
            },
            page: page,
          ),
        ],
      ),
    );
  }
}

class XetiaBottomNavBar extends StatefulWidget {
  final int page;
  final Function onTap;

  const XetiaBottomNavBar({Key key, this.page, this.onTap}) : super(key: key);

  @override
  _XetiaBottomNavBarState createState() => _XetiaBottomNavBarState();
}

class _XetiaBottomNavBarState extends State<XetiaBottomNavBar> {
  List<NavBarItem> items;
  bool showFAB = false;

  @override
  void initState() {
    super.initState();
    items = [
      NavBarItem(Icons.home, Icons.home_outlined),
      NavBarItem(Icons.favorite, Icons.favorite_border),
      NavBarItem(Icons.shop, Icons.shop_outlined),
      NavBarItem(Icons.settings, Icons.settings_outlined),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return !showFAB
        ? Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomCurvedNavBar(
              onTap: widget.onTap,
              onDoubleTap: () {
                setState(() {
                  showFAB = true;
                });
              },
              page: widget.page,
              items: items,
            ),
          )
        : MyDraggableFAB(
            onTap: () {
              setState(() {
                showFAB = false;
              });
            },
            selectedIndex: widget.page,
            items: items,
          );
  }
}
