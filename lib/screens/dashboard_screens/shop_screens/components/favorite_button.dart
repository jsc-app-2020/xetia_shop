import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final Color color;

  const CustomIconButton({
    Key key,
    this.onTap,
    this.icon = Icons.favorite,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      margin: EdgeInsets.all(4),
      decoration:
          ShapeDecoration(shape: CircleBorder(), color: Colors.white, shadows: [
        BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 2),
      ]),
      child: IconButton(
        icon: Icon(
          icon,
          color: color,
          size: 15,
        ),
        onPressed: onTap,
      ),
    );
  }
}
