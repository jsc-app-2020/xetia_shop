import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class AddOrRemoveProduct extends StatelessWidget {
  final Function onTap;
  final IconData icon;

  const AddOrRemoveProduct({Key key, this.onTap, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: kOrange,
          size: 12,
        ),
      ),
    );
  }
}
