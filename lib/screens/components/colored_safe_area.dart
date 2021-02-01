import 'package:flutter/material.dart';

// ini sebagai pembungkus SafeArea agar statusBar mempunyai warna
class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color color;

  const ColoredSafeArea({Key key, @required this.color, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).colorScheme.primaryVariant,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
