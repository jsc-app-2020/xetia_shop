import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xetia_shop/screens/home_screen.dart';
import 'package:xetia_shop/screens/signin_screens/sign_in_screen.dart';
import 'package:xetia_shop/screens/signup_screens/sign_up_name.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool hasSignIn = preferences
          .getBool("https://02jsc2020-eval-test.apigee.net/user/login") ??
      false;
  runApp(MaterialApp(
      home: MyApp(
    hasSignIn: hasSignIn,
  )));
}

class MyApp extends StatelessWidget {
  final bool hasSignIn;

  const MyApp({Key key, this.hasSignIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'XETIA SHOP',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: "Open-Sans",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: HomeScreen(),
        initialRoute: hasSignIn ? "/home" : "/signIn",
        routes: {
          HomeScreen.name: (context) => HomeScreen(),
          SignInScreen.name: (context) => SignInScreen(),
          SignUpNameScreen.name: (context) => SignUpNameScreen()
        },
      ),
    );
  }
}
