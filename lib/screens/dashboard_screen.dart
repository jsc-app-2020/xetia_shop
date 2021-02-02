import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:xetia_shop/screens/components/colored_safe_area.dart';
import 'package:xetia_shop/screens/components/search_text_field_grey.dart';
import 'package:xetia_shop/screens/components/sliver_shifting_app_bar_delegate.dart';

import 'constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> tabText;
  List<IconData> tabIcon;
  GlobalKey<FormState> formKeyShop = GlobalKey<FormState>();
  String searchShop = "";

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
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        'Halal food in Japan',
                                        style: kDarkHeaderStyle,
                                      ),
                                    ),
                                  ),
                                  StatefulBuilder(
                                    builder: (context, setState) => Form(
                                      key: formKeyShop,
                                      child: Container(
                                        child: SearchTextFieldGrey(
                                          hintText:
                                              "Search halal food in Japan",
                                          controller: searchShop,
                                          onPressed: () {
                                            if (formKeyShop.currentState
                                                .validate()) {
                                              print("search");
                                            }
                                          },
                                          onFieldSubmitted: (value) {
                                            if (formKeyShop.currentState
                                                .validate()) {
                                              print(value);
                                            }
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              searchShop = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Please enter some text";
                                            }
                                            return null;
                                          },
                                          closeSearch: () {
                                            setState(() {
                                              searchShop = "";
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "3600",
                                              textAlign: TextAlign.center,
                                              style: kDarkBoldStyle,
                                            ),
                                            Text(
                                              "Halal Food",
                                              textAlign: TextAlign.center,
                                              style: kDarkNormalStyle,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "34",
                                              textAlign: TextAlign.center,
                                              style: kDarkBoldStyle,
                                            ),
                                            Text(
                                              "Mosque",
                                              textAlign: TextAlign.center,
                                              style: kDarkNormalStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "210",
                                              textAlign: TextAlign.center,
                                              style: kDarkBoldStyle,
                                            ),
                                            Text(
                                              "Halal Shop",
                                              textAlign: TextAlign.center,
                                              style: kDarkNormalStyle,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "24",
                                              textAlign: TextAlign.center,
                                              style: kDarkBoldStyle,
                                            ),
                                            Text(
                                              "Muslim Community",
                                              textAlign: TextAlign.center,
                                              style: kDarkNormalStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "1300",
                                              textAlign: TextAlign.center,
                                              style: kDarkBoldStyle,
                                            ),
                                            Text(
                                              "Halal Restaurant",
                                              textAlign: TextAlign.center,
                                              style: kDarkNormalStyle,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "3",
                                              textAlign: TextAlign.center,
                                              style: kDarkBoldStyle,
                                            ),
                                            Text(
                                              "Muslim corner",
                                              textAlign: TextAlign.center,
                                              style: kDarkNormalStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
