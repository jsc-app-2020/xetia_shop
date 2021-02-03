import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/home_screen.dart';
import 'package:xetia_shop/screens/sign_in_screen.dart';
import 'package:xetia_shop/screens/sign_up_name.dart';

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
      // home: HomeScreen(),
      initialRoute: "/signIn",
      routes: {
        HomeScreen.name: (context) => HomeScreen(),
        SignInScreen.name: (context) => SignInScreen(),
        SignUpNameScreen.name: (context) => SignUpNameScreen()
      },
    );
  }
}
