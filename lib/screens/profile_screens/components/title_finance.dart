import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

class TitleFinance extends StatelessWidget {
  final bool isDark;
  final String title;

  const TitleFinance({Key key, this.isDark, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: isDark ? kBoldStyle : kDarkBoldStyle,
          ),
          SizedBox(width: 140),
          Text(
            "See Details",
            textAlign: TextAlign.center,
            style: kCustomStyle(12, Colors.black),
          ),
        ],
      ),
    );
  }
}
