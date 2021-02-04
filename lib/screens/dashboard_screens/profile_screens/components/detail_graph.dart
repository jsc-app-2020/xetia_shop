import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

import 'circle_graph.dart';

class DetailGraph extends StatelessWidget {
  final String text;
  final bool isDark;
  final Color color;

  const DetailGraph({Key key, this.text, this.isDark, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleGraph(
          size: 20,
          colorCircle: color,
        ),
        SizedBox(width: 16),
        Text(
          text,
          textAlign: TextAlign.center,
          style: isDark ? kNormalStyle : kDarkNormalStyle,
        ),
      ],
    );
  }
}
