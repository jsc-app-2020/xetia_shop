import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

import 'components/message_room_body.dart';

class MessageRoomScreen extends StatelessWidget {
  final bool isDark;
  final Color color;

  const MessageRoomScreen({Key key, this.isDark, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? kGrey : Colors.white.withOpacity(0.7),
      appBar: AppBar(
        elevation: 4,
        automaticallyImplyLeading: false,
        backgroundColor: isDark ? kGrey : Colors.white,
        toolbarHeight: 70,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Platform.isAndroid ? Icons.arrow_back : CupertinoIcons.back,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/5.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Taylor Swift",
                        style: isDark ? kBoldStyle : kDarkBoldStyle,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: isDark ? kNormalStyle : kDarkNormalStyle,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_vert_rounded,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: MessageRoomBody(isDark: false, color: kYellow)),
          Container(
            width: double.infinity,
            height: 75,
            color: isDark ? kGrey : Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.add_circled,
                  color: isDark ? Colors.white : Colors.black,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[200], width: 1),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Type a message",
                      textAlign: TextAlign.center,
                      style: isDark ? kNormalStyle : kDarkNormalStyle,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.send_rounded,
                  color: color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
