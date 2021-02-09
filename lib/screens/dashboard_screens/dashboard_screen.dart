import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:xetia_shop/components/colored_safe_area.dart';
import 'package:xetia_shop/components/sliver_shifting_app_bar_delegate.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/screens/dashboard_screens/message_screens/message_screen.dart';
import 'package:xetia_shop/screens/dashboard_screens/profile_screens/profile_screen.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/shop_screen.dart';

class DashboardScreen extends StatefulWidget {
  final bool isDark;

  const DashboardScreen({Key key, this.isDark}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> tabText;
  List<IconData> tabIcon;

  List<ShiftingTab> getList(
      List<String> tabText, List<IconData> tabIcon, bool isDark) {
    List<ShiftingTab> childes = [];
    for (var i = 0; i < tabText.length; i++) {
      childes.add(ShiftingTab(
          text: tabText[i],
          icon: Icon(
            tabIcon[i],
            size: 30,
            color: isDark ? kBgBlack : kBgWhite,
          )));
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
      color: widget.isDark ? kBgBlack : kBgWhite,
      child: Scaffold(
        backgroundColor: widget.isDark ? kBgBlack : kBgWhite,
        body: DefaultTabController(
          length: tabText.length,
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverPersistentHeader(
                  delegate: SliverShiftingAppBarDelegate(
                    ShiftingTabBar(
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kOrange,
                        fontSize: 24,
                      ),
                      tabs: getList(tabText, tabIcon, widget.isDark),
                      color: !widget.isDark ? kBgBlack : kBgWhite,
                      forceUpperCase: false,
                    ),
                  ),
                  pinned: false,
                  floating: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                ShopScreen(),
                ProfileScreen(
                  isDark: widget.isDark,
                ),
                MessageScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
