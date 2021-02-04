import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/favorite_button.dart';

class FourRectangleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomIconButton(),
              CustomIconButton(),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomIconButton(),
              CustomIconButton(),
            ],
          ),
        ],
      ),
    );
  }
}
