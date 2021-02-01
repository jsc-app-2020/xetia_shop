import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/components/colored_safe_area.dart';
import 'package:xetia_shop/components/sliver_app_bar_delegate.dart';

import 'constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> tabText;
  List<IconData> tabIcon;

  List<Widget> getList(List<String> tabText, List<IconData> tabIcon) {
    List<Widget> childes = [];
    for (var i = 0; i < tabText.length; i++) {
      childes.add(Tab(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(tabIcon[i]),
            SizedBox(width: 5),
            Text(tabText[i]),
          ],
        ),
      ));
    }
    return childes;
  }

  @override
  void initState() {
    super.initState();
    tabText = ["Shop", "Profile", "Message"];
    tabIcon = [
      Icons.shop,
      CupertinoIcons.profile_circled,
      Icons.message_rounded
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      color: kBgWhite,
      child: Scaffold(
        backgroundColor: kBgWhite,
        body: DefaultTabController(
          length: tabText.length,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    TabBar(
                      labelColor: kOrange,
                      unselectedLabelColor: kGrey,
                      indicatorColor: kOrange,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                      physics: BouncingScrollPhysics(),
                      labelStyle: TextStyle(fontWeight: FontWeight.w700),
                      tabs: getList(tabText, tabIcon),
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
