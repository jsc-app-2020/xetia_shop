import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  final Color color;
  final bool isDark;
  final double round;
  final String text;
  final Function onTap;
  final double horizontal;
  final Color bgColor;
  final Color txtColor;
  final double vertical;
  final double fontSize;

  const Badges(
      {Key key,
      this.color,
      this.isDark,
      this.round,
      this.text,
      this.onTap,
      this.horizontal,
      this.bgColor,
      this.txtColor,
      this.vertical,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(round == null ? 15 : round),
          border: Border.all(
            color: color,
            width: 1,
          ),
          color: bgColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: horizontal == null ? 20 : horizontal,
          vertical: vertical == null ? 6 : vertical,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontSize: fontSize == null ? 14 : fontSize,
          ),
        ),
      ),
    );
  }
}
