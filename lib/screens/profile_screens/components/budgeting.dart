import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

import 'detail_graph.dart';
import 'title_finance.dart';

class Budgeting extends StatelessWidget {
  final Color color;
  final bool isDark;

  const Budgeting({Key key, this.color, this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: true ? Colors.white.withOpacity(0.7) : kGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Budgeting",
                  textAlign: TextAlign.center,
                  style: kDarkBoldStyle,
                ),
                SizedBox(width: 140),
                Text(
                  "See Details",
                  textAlign: TextAlign.center,
                  style: kCustomStyle(12, kYellow),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 113,
                    height: 113,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff6b96fa),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DetailGraph(
                            isDark: isDark,
                            text: "Food and Drink",
                            color: Color(0xff6b96fa)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DetailGraph(
                            isDark: isDark,
                            text: "Wifi Bills",
                            color: Color(0xFFf1bb41)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DetailGraph(
                            isDark: isDark,
                            text: "House Bills",
                            color: Color(0xFF25C685)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
