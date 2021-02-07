import 'package:flutter/material.dart';
import 'package:xetia_shop/components/draggable_fab.dart';
import 'package:xetia_shop/components/xetia_bottom_nav_bar.dart';

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
  List<NavBarItem> items;
  bool showFAB = false;

  @override
  void initState() {
    super.initState();
    bodies = [
      DashboardScreen(),
      FavoriteScreen(),
      CartScreen(),
      SettingScreen(),
    ];
    items = [
      NavBarItem(Icons.home, Icons.home_outlined),
      NavBarItem(Icons.favorite, Icons.favorite_border),
      NavBarItem(Icons.shop, Icons.shop_outlined),
      NavBarItem(Icons.settings, Icons.settings_outlined),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bodies[page],
          StatefulBuilder(
            builder: (context, statefulSetState) {
              return !showFAB
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: XetiaBottomNavBar(
                        onTap: (value) {
                          setState(() {
                            page = value;
                          });
                        },
                        onDoubleTap: () {
                          statefulSetState(() {
                            showFAB = true;
                          });
                        },
                        page: page,
                        items: items,
                      ),
                    )
                  : MyDraggableFAB(
                      onTap: () {
                        statefulSetState(() {
                          showFAB = false;
                        });
                      },
                      selectedIndex: page,
                      items: items,
                    );
            },
          ),
        ],
      ),
    );
  }
}
