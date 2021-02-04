import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';
import 'package:xetia_shop/core/network/product/product_data.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/grid_product/grid_product.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/header_shop.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/popular_shop.dart';

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
