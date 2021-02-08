import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class ProductReview extends StatelessWidget {
  final bool isDark;

  const ProductReview({Key key, this.isDark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDark ? kBgGrey : kWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Halal Product Review",
                    textAlign: TextAlign.left,
                    style: isDark ? kBoldStyle : kDarkBoldStyle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "2021",
                    textAlign: TextAlign.left,
                    style: kCustomStyle(18, kYellow),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: 300,
                  ),
                )
              ]),
        ));
  }
}
