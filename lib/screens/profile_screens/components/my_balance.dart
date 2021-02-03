import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

import 'title_finance.dart';

class MyBalance extends StatelessWidget {
  final Color color;
  final bool isDark;

  const MyBalance({Key key, this.color, this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: kYellow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // tampilan template title my balance
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "My Balance",
                  textAlign: TextAlign.center,
                  style: kDarkBoldStyle,
                ),
                SizedBox(width: 140),
                Text(
                  "See Details",
                  textAlign: TextAlign.center,
                  style: kCustomStyle(12, Colors.black),
                ),
              ],
            ),
          ),

          // content my balance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: color,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "balance",
                      textAlign: TextAlign.center,
                      style: kNormalStyle,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Rp. 0",
                      textAlign: TextAlign.center,
                      style: isDark ? kNormalStyle : kDarkNormalStyle,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: color,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "credits",
                      textAlign: TextAlign.center,
                      style: kNormalStyle,
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Rp. 0",
                      textAlign: TextAlign.center,
                      style: isDark ? kNormalStyle : kDarkNormalStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
