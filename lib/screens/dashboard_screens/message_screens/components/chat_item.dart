import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

import '../message_room.dart';
import 'avatar.dart';
import 'chat_member.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key key,
    @required this.isDark,
    @required this.color,
  }) : super(key: key);

  final bool isDark;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageRoomScreen(
              isDark: false,
              color: kYellow,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: isDark ? kGrey : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Avatar(color: color),
                  SizedBox(width: 18),
                  Expanded(child: ChatMember(isDark: isDark)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "11:00",
                    style: kNormalStyle.copyWith(color: color),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: color.withOpacity(0.5),
                      shape: CircleBorder(),
                    ),
                    child: Text(
                      "1",
                      style: kNormalStyle.copyWith(color: color),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
