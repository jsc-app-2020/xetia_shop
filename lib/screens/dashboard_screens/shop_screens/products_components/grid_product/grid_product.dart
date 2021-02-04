import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/products_components/detail_product/detail_product_dialog.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/products_components/grid_product/loading_bar_more_product.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/products_components/grid_product/product_card.dart';

class GridProduct extends StatelessWidget {
  final bool isLoadMore;
  final bool isNotFound;
  final List<Product> products;

  GridProduct({
    Key key,
    this.isLoadMore,
    this.products,
    this.isNotFound,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNotFound
        ? Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Text(
                "NO DATA FOUND",
                style: kDarkContainerStyle,
              ),
            ),
          )
        : (products.isNotEmpty)
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: products.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          index: index,
                          product: products[index],
                          onTap: () {
                            // show detail dengan bottom sheet
                            _showSheet(
                                products, context, products.length, index);
                          },
                        );
                      },
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                  LoadingBarMoreProduct(isLoadMore: isLoadMore),
                ],
              )
            : Container(
                height: 250,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
  }

  // fun show detail bottomshhet
  void _showSheet(List<Product> product, BuildContext context,
      int productLength, int indexParent) {
    showBarModalBottomSheet(
      backgroundColor: Colors.white,
      barrierColor: kOrange.withOpacity(0.7),
      context: context,
      enableDrag: true,
      isDismissible: true,
      expand: true,
      bounce: true,
      builder: (mContext) => Center(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return DetailProductDialog(
              product: product[index],
              mContext: mContext,
            );
          },
          index: indexParent,
          loop: false,
          itemCount: productLength,
          // di bawah untuk memunculkan indikator dot
          // pagination: new SwiperPagination(),

          // mengatur icon dan color logo
          control: SwiperControl(
            color: kOrange,
            iconNext: Icons.keyboard_arrow_right_rounded,
            iconPrevious: Icons.keyboard_arrow_left_rounded,
            size: 36,
          ),
        ),
      ),
    );
  }
}
