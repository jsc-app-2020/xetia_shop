import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class MessageRoomBody extends StatelessWidget {
  final bool isDark;
  final Color color;

  const MessageRoomBody({Key key, this.isDark, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: true,
            ),
            BubbleChat(
              color: color,
              isDark: isDark,
              text:
                  "Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet Lorem Ipsum Dolor Sit Amet ",
              isRight: false,
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleChat extends StatelessWidget {
  final String text;
  final bool isDark;
  final Color color;
  final bool isRight;

  const BubbleChat({Key key, this.text, this.isDark, this.color, this.isRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bubble(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Text(
          text,
          style: isDark ? kNormalStyle : kDarkNormalStyle,
        ),
      ),
      color: !isDark
          ? isRight
              ? kGrey
              : color
          : Colors.white,
      margin: isRight
          ? BubbleEdges.fromLTRB(
              MediaQuery.of(context).size.width * 0.2, 10, 0, 0)
          : BubbleEdges.fromLTRB(
              0, 10, MediaQuery.of(context).size.width * 0.2, 0),
      nip: isRight ? BubbleNip.rightBottom : BubbleNip.leftBottom,
      nipWidth: 4,
      radius: Radius.circular(10),
      nipRadius: 1,
    );
  }
}
