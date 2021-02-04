import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class RatingBar extends StatelessWidget {
  final int rate;

  const RatingBar({
    Key key,
    this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(2),
      height: 10,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 5,
            width: 5,
            margin: EdgeInsets.symmetric(horizontal: 1),
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: index < rate ? kOrange : kOrange.withOpacity(0.3),
            ),
          );
        },
        itemCount: 10,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class RatingBarExpanded extends StatelessWidget {
  final int rate;

  const RatingBarExpanded({
    Key key,
    this.rate,
  }) : super(key: key);

  List<RatingBullet> generateRating() {
    List<RatingBullet> ratings = [];
    for (int i = 0; i < 10; i++) {
      ratings.add(
        RatingBullet(
          color: i < rate ? kOrange : kOrange.withOpacity(0.3),
        ),
      );
    }
    return ratings;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        children: generateRating(),
      ),
    );
  }
}

class RatingBullet extends StatelessWidget {
  final int rate;
  final Color color;

  const RatingBullet({Key key, this.rate, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.all(3),
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: color,
      ),
    );
  }
}
