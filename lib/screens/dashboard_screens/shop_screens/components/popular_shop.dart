import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class PopularShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Popular Shops",
              style: kDarkContainerStyle,
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  10,
                  (index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(
                                      (Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                  .withOpacity(1.0),
                              radius: 50,
                            ),
                            SizedBox(height: 4),
                            Text("Sariraya", style: kDarkBoldStyle),
                            SizedBox(height: 2),
                            Text("Nagoya", style: kDarkNormalStyle),
                          ],
                        ),
                      )),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
