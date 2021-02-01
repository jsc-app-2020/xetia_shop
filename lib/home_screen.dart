import 'package:flutter/material.dart';
import 'package:xetia_shop/cart_screen.dart';
import 'package:xetia_shop/components/xetia_bottom_nav_bar.dart';
import 'package:xetia_shop/dashboard_screen.dart';
import 'package:xetia_shop/favorite_screen.dart';
import 'package:xetia_shop/setting_screen.dart';

class HomeScreen extends StatefulWidget {
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
    return Scaffold(
      extendBody: true,
      body: bodies[page],
      bottomNavigationBar: XetiaBottomNavBar(
        page: page,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
    );
  }
}
