import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

class ChatMember extends StatelessWidget {
  const ChatMember({
    Key key,
    @required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Taylor Swift",
          textAlign: TextAlign.center,
          style: isDark
              ? kContainerStyle.copyWith(fontSize: 18)
              : kDarkContainerStyle.copyWith(fontSize: 18),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(height: 5),
        Text(
          "Lorem Ipsum Dolor sit Amet Lorem Ipsum Dolor sit Amet Lorem Ipsum Dolor sit Amet",
          textAlign: TextAlign.center,
          style: kGreyStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
