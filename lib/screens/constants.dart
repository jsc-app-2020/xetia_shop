import 'package:flutter/material.dart';

const Color kOrange = Color(0xFFFCB216);
Color kGrey = Colors.grey[700];
const Color kBgWhite = Color(0xFFf3f3f3);
const Color kGreen = Color(0xFF25C685);
const Color kYellow = Color(0xFFf1bb41);
const Color kGreenGrey = Color(0xFF7de6bd);
const Color kRed = Color(0xFFFF575F);

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

TextStyle kDarkContainerStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 24,
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
