import 'package:flutter/material.dart';

class CircleGraph extends StatelessWidget {
  final double size;
  final Color colorCircle;

  const CircleGraph({Key key, this.size, this.colorCircle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: colorCircle,
      ),
    );
  }
}
