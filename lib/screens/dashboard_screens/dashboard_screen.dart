import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:xetia_shop/screens/components/carousel_card_container.dart';
import 'package:xetia_shop/screens/components/colored_safe_area.dart';
import 'package:xetia_shop/screens/components/search_text_field_grey.dart';
import 'package:xetia_shop/screens/components/sliver_shifting_app_bar_delegate.dart';
import 'package:xetia_shop/screens/message_screens/components/chat_item.dart';
import 'package:xetia_shop/screens/model/product/product_response.dart';
import 'package:xetia_shop/screens/network/product/product_data.dart';
import 'package:xetia_shop/screens/products_components/grid_product/grid_product.dart';
import 'package:xetia_shop/screens/components/my_button.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/profile_screens/business_card_item.dart';
import 'package:xetia_shop/screens/profile_screens/components/budgeting.dart';
import 'package:xetia_shop/screens/profile_screens/components/history_transaction.dart';
import 'package:xetia_shop/screens/profile_screens/components/my_balance.dart';
import 'package:xetia_shop/screens/profile_screens/components/profile_card.dart';
import 'package:xetia_shop/screens/signin_screens/sign_in_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> tab;
  List<String> tabText;
  List<IconData> tabIcon;
  GlobalKey<FormState> formKeyShop = GlobalKey<FormState>();
  String searchShop = "";
  int selectedIndex = 0;
  int page = 1;
  int pageSearch = 1;
  bool isWaiting = false;
  bool isLoadMore = false;
  bool isLoadByCategory = true;
  bool isSearch = false;
  bool isNotFound = false;
  List<Product> productList = [];
  int indexCategory;
  List<dynamic> category;
  String search = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Widget> list = [
    BusinessCardItem(color: kYellow),
    BusinessCardItem(color: kYellow),
    BusinessCardItem(color: kYellow),
  ];

  void getProductData() async {
    setState(() {
      isLoadByCategory = true;
    });
    try {
      ProductResponse productResponse = await getProduct(page);
      setState(() {
        productList = productResponse.response.data;
        isNotFound = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isNotFound = true;
      });
    }
    setState(() {
      isLoadByCategory = false;
    });
  }

  void getMoreProductData(int page) async {
    setState(() {
      isLoadMore = true;
    });
    try {
      ProductResponse productResponse = await getProduct(page);
      setState(() {
        productList.addAll(productResponse.response.data);
        isNotFound = false;
      });
    } catch (e) {
      setState(() {
        isNotFound = true;
      });
      print(e);
    }
    setState(() {
      isLoadMore = false;
    });
  }

  void getSearchProduct(String search) async {
    setState(() {
      isSearch = true;
      isLoadByCategory = true;
    });
    try {
      final result = await getProduct(1, search: search);
      setState(() {
        productList.clear();
        productList.addAll(result.response.data);
        isNotFound = false;
      });
      print("get product by search");
    } catch (e) {
      setState(() {
        isNotFound = true;
      });
      print(e);
    }
    setState(() {
      isLoadByCategory = false;
    });
  }

  void getMoreSearchProduct(int page, String search) async {
    setState(() {
      isLoadMore = true;
    });
    try {
      final result = await getProduct(page, search: search);
      setState(() {
        productList.addAll(result.response.data);
        isNotFound = false;
      });
      print("get product by search");
    } catch (e) {
      setState(() {
        isNotFound = true;
      });
      print(e);
    }
    setState(() {
      isLoadMore = false;
    });
  }

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
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return isWaiting
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (!isLoadMore &&
                    notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent) {
                  if (isSearch) {
                    getMoreSearchProduct(++pageSearch, search);
                  } else {
                    getMoreProductData(++page);
                  }
                }
                return true;
              },
              child: ColoredSafeArea(
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
                          SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20),
                                      ),
                                      boxShadow: kShadow,
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
                                              builder: (context, setState) =>
                                                  Form(
                                                key: formKeyShop,
                                                child: Container(
                                                  child: SearchTextFieldGrey(
                                                    hintText:
                                                        "Search halal food in Japan",
                                                    controller: searchShop,
                                                    onPressed: () {
                                                      if (formKeyShop
                                                          .currentState
                                                          .validate()) {
                                                        print("search");
                                                      }
                                                    },
                                                    onFieldSubmitted: (value) {
                                                      if (formKeyShop
                                                          .currentState
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
                                          padding:
                                              EdgeInsets.fromLTRB(0, 20, 0, 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "3600",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkBoldStyle,
                                                      ),
                                                      Text(
                                                        "Halal Food",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkNormalStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "34",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkBoldStyle,
                                                      ),
                                                      Text(
                                                        "Mosque",
                                                        textAlign:
                                                            TextAlign.center,
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "210",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkBoldStyle,
                                                      ),
                                                      Text(
                                                        "Halal Shop",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkNormalStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "24",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkBoldStyle,
                                                      ),
                                                      Text(
                                                        "Muslim Community",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkNormalStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "1300",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkBoldStyle,
                                                      ),
                                                      Text(
                                                        "Halal Restaurant",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkNormalStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "3",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: kDarkBoldStyle,
                                                      ),
                                                      Text(
                                                        "Muslim corner",
                                                        textAlign:
                                                            TextAlign.center,
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
                                  SizedBox(height: 20),
                                  GridProduct(
                                    isLoadMore: isLoadMore,
                                    products: productList,
                                    isNotFound: isNotFound,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                ProfileCard(),
                                MyBalance(color: kYellow, isDark: false),
                                SizedBox(height: 25),
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child:
                                        Budgeting(color: kGrey, isDark: false)),
                                SizedBox(height: 25),
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: MyButton(
                                    color: kGreen,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, SignInScreen.name);
                                    },
                                    text: "Logout",
                                  ),
                                ),
                                SizedBox(height: 25)
                              ],
                            ),
                          ),
                          DefaultTabController(
                              length: 2,
                              child: NestedScrollView(
                                physics: BouncingScrollPhysics(),
                                headerSliverBuilder: (BuildContext context,
                                    bool innerBoxIsScrolled) {
                                  return <Widget>[
                                    kSliverTabBar(
                                        isDark: false, color: kYellow, tab: tab)
                                  ];
                                },
                                body: TabBarView(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Column(children: [
                                          Padding(
                                            padding: EdgeInsets.all(25),
                                            child: Form(
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
                                          ChatItem(
                                              isDark: false, color: kYellow),
                                        ]),
                                      ),
                                    ),
                                    Icon(Icons.directions_transit),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
