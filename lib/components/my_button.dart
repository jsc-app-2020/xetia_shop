import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class MyButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;

  const MyButton(
      {Key key,
      @required this.onTap,
      @required this.text,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: kBoxDecoration(color),
      child: FlatButton(
        onPressed: onTap,
        color: color,
        shape: kRoundedBorder,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final Function onTap;
  final Color color;
  final IconData icon;

  const ButtonIcon(
      {Key key, @required this.onTap, @required this.color, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              offset: Offset(0, 2))
        ],
      ),
      child: FlatButton(
        onPressed: onTap,
        color: color.withOpacity(0.4),
        shape: kRoundedBorder,
        child: Center(
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
