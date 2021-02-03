import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

class ListHistory extends StatelessWidget {
  final Color color;
  final bool isDark;
  final String text;
  final String date;
  final String price;
  final Color colorPrice;
  final IconData icon;

  const ListHistory(
      {Key key,
      this.color,
      this.isDark,
      this.text,
      this.date,
      this.price,
      this.colorPrice,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.left,
                  style: false
                      ? kCustomBoldStyle(14, Colors.white)
                      : kCustomBoldStyle(14, Colors.black),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  date,
                  textAlign: TextAlign.left,
                  style: kCustomStyle(12, Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              price,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorPrice,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
