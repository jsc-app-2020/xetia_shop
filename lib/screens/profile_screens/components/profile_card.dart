import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                child: Container(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    "https://picsum.photos/250?image=9",
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tince",
                    textAlign: TextAlign.left,
                    style: kDarkNormalStyle,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Edit Profile",
                    textAlign: TextAlign.left,
                    style: kDarkNormalStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  child: Icon(Icons.arrow_right, color: Colors.black)),
            )
          ],
        ));
  }
}
