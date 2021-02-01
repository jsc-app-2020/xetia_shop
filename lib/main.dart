import 'package:flutter/material.dart';
import 'package:xetia_shop/home_screen.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XETIA SHOP',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: "Open-Sans",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
