import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/grid_product/grid_product.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/header_shop.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/popular_shop.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with AutomaticKeepAliveClientMixin<ShopScreen> {
  String searchShop = "";
  GlobalKey<FormState> formKeyShop = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              HeaderShop(
                onChangedShop: (value) {
                  searchShop = value;
                },
                onCloseShop: () {
                  setState(() {
                    searchShop = "";
                  });
                },
                searchShop: searchShop,
                formKeyShop: formKeyShop,
              ),
              SizedBox(height: 20),
              PopularShop(),
              GridProduct(search: searchShop),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
