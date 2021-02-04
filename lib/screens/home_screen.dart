import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/components/colored_safe_area.dart';
import 'package:xetia_shop/screens/components/xetia_bottom_nav_bar.dart';
import 'package:xetia_shop/screens/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      color: kBgWhite,
      child: Scaffold(
        body: bodies[page],
        bottomNavigationBar: XetiaBottomNavBar(
          onTap: (value) {
            setState(() {
              page = value;
            });
          },
        ),
      ),
    );
  }
}
