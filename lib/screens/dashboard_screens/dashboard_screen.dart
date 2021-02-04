import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:xetia_shop/screens/components/colored_safe_area.dart';
import 'package:xetia_shop/screens/components/sliver_shifting_app_bar_delegate.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/profile_screen/profile_screen.dart';
import 'package:xetia_shop/shop_screen/shop_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> tab;
  List<String> tabText;
  List<IconData> tabIcon;

  List<ShiftingTab> getList(List<String> tabText, List<IconData> tabIcon) {
    List<ShiftingTab> childes = [];
    for (var i = 0; i < tabText.length; i++) {
      childes.add(ShiftingTab(
          text: tabText[i],
          icon: Icon(
            tabIcon[i],
            size: 30,
          )));
    }
    return childes;
  }

  @override
  void initState() {
    super.initState();
    tabText = ["Shop", "Profile", "Message"];
    tab = ["All", "Unread"];
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
                      tabs: getList(tabText, tabIcon),
                      color: Colors.white,
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
                ProfileScreen(),
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
