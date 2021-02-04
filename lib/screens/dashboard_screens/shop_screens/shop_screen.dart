import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/components/search_text_field_grey.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';
import 'package:xetia_shop/core/network/product/product_data.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/products_components/grid_product/grid_product.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with AutomaticKeepAliveClientMixin<ShopScreen> {
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

  @override
  void initState() {
    super.initState();
    getProductData();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  child: Column(
                    children: [
                      HeaderShop(),
                      SizedBox(height: 20),
                      PopularShop(),
                      GridProduct(
                        isLoadMore: isLoadMore,
                        products: productList,
                        isNotFound: isNotFound,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class PopularShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Popular Shops",
              style: kDarkContainerStyle,
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  10,
                  (index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(
                                      (Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                  .withOpacity(1.0),
                              radius: 50,
                            ),
                            SizedBox(height: 4),
                            Text("Sariraya", style: kDarkBoldStyle),
                            SizedBox(height: 2),
                            Text("Nagoya", style: kDarkNormalStyle),
                          ],
                        ),
                      )),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class HeaderShop extends StatefulWidget {
  @override
  _HeaderShopState createState() => _HeaderShopState();
}

class _HeaderShopState extends State<HeaderShop> {
  String searchShop = "";
  GlobalKey<FormState> formKeyShop = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      hintText: "Search halal food in Japan",
                      controller: searchShop,
                      onPressed: () {
                        if (formKeyShop.currentState.validate()) {
                          print("search");
                        }
                      },
                      onFieldSubmitted: (value) {
                        if (formKeyShop.currentState.validate()) {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
