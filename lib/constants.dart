import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/components/sliver_app_bar_delegate.dart';

const Color kOrange = Color(0xFFFCB216);
const Color kOrangeDark = Color(0xFFFCB216);
Color kGrey = Colors.grey[500];
const Color kBgGrey = Color(0xFF616568);
const Color kBgWhite = Color(0xFFf3f3f3);
const Color kBgBlack = Color(0xFF000000);
const Color kGreen = Color(0xFF25C685);
const Color kYellow = Color(0xFFf1bb41);
const Color kGreenGrey = Color(0xFF7de6bd);
const Color kRed = Color(0xFFFF575F);
const Color kWhite = Color(0xFFffffff);

Color kRandomColor =
    Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

TextStyle kHeaderStyle =
    TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.w900);

TextStyle kDarkHeaderStyle =
    TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.w900);

TextStyle kBoldStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 18,
);

TextStyle kDarkBoldStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 18,
);

TextStyle kGreyStyle = TextStyle(
  color: Colors.grey,
);

TextStyle kNormalStyle =
    TextStyle(color: Colors.white, fontSize: 14, fontFamily: "Montserrat");

TextStyle kDarkNormalStyle =
    TextStyle(color: Colors.black, fontSize: 14, fontFamily: "Montserrat");

TextStyle kLinkStyle =
    TextStyle(color: Colors.blueAccent, fontSize: 14, fontFamily: "Montserrat");

TextStyle kCustomStyle(double size, Color color) =>
    TextStyle(color: color, fontSize: size, fontFamily: "Montserrat");

TextStyle kCustomBoldStyle(double size, Color color) => TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
    );

BoxDecoration kBoxDecoration(Color color) => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(15),
    );

RoundedRectangleBorder kRoundedBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15),
);

TextStyle kContainerStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 24,
);

TextStyle kDarkContainerStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 24,
);

List<BoxShadow> kShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.2),
    blurRadius: 8,
    offset: Offset(0, 2),
  ),
];

SliverPersistentHeader kSliverTabBar(
        {List<String> tab, Color color, bool isDark}) =>
    SliverPersistentHeader(
      delegate: SliverAppBarDelegate(
        TabBar(
          labelColor: !isDark ? color : Colors.white,
          unselectedLabelColor: Colors.black.withOpacity(0.5),
          indicatorColor: !isDark ? color : Colors.black,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
          physics: BouncingScrollPhysics(),
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          tabs: getList(tab),
        ),
        isDark,
        color,
      ),
      pinned: true,
    );

List<Widget> getList(List tab) {
  List<Widget> childs = [];
  for (var i = 0; i < tab.length; i++) {
    childs.add(Tab(
      text: tab[i],
    ));
  }
  return childs;
}
