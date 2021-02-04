import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xetia_shop/constants.dart';

class BusinessCardItem extends StatelessWidget {
  final Color color;

  const BusinessCardItem({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [color.withOpacity(0.3), color.withOpacity(0.1)],
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "XETIA",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Muhammad Faisal",
                      textAlign: TextAlign.center,
                      style: kDarkBoldStyle,
                    ),
                    Text(
                      "UI/UX Designer",
                      textAlign: TextAlign.center,
                      style: kGreyStyle,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/svg/logo-xetia.svg",
                color: color.withOpacity(0.7),
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
