import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:xetia_shop/screens/components/carousel_card_container.dart';
import 'package:xetia_shop/screens/components/colored_safe_area.dart';
import 'package:xetia_shop/screens/components/my_button.dart';
import 'package:xetia_shop/screens/components/sliver_shifting_app_bar_delegate.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/profile_screens/business_card_item.dart';
import 'package:xetia_shop/screens/profile_screens/components/budgeting.dart';
import 'package:xetia_shop/screens/profile_screens/components/history_transaction.dart';
import 'package:xetia_shop/screens/profile_screens/components/my_balance.dart';
import 'package:xetia_shop/screens/profile_screens/components/profile_card.dart';
import 'package:xetia_shop/screens/signin_screens/sign_in_screen.dart';
import 'package:xetia_shop/shop_screen/shop_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> tabText;
  List<IconData> tabIcon;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Widget> list = [
    BusinessCardItem(color: kYellow),
    BusinessCardItem(color: kYellow),
    BusinessCardItem(color: kYellow),
  ];

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
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ProfileCard(),
                      MyBalance(color: kYellow, isDark: false),
                      SizedBox(height: 25),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Budgeting(color: kGrey, isDark: false)),
                      SizedBox(height: 25),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: HistoryTransaction(
                              color: kYellow, isDark: false)),
                      SizedBox(height: 25),
                      CarouselCardContainer(
                        color: kYellow,
                        isDark: false,
                        list: list,
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: MyButton(
                          color: kGreen,
                          onTap: () {
                            Navigator.pushNamed(context, SignInScreen.name);
                          },
                          text: "Logout",
                        ),
                      ),
                      SizedBox(height: 25)
                    ],
                  ),
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
