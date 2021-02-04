import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/detail_product/detail_product_dialog.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/grid_product/loading_bar_more_product.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/grid_product/product_card.dart';

class GridProduct extends StatefulWidget {
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
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Best Seller",
              style: kDarkContainerStyle,
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("5,763 Products", style: kCustomStyle(14, kOrange)),
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGrid = true;
                          });
                        },
                        child: Container(
                          decoration: isGrid
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kOrange,
                                )
                              : BoxDecoration(),
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.grid_on,
                              color: isGrid ? kBgWhite : kOrange),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isGrid = false;
                          });
                        },
                        child: Container(
                          decoration: !isGrid
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kOrange,
                                )
                              : BoxDecoration(),
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.list,
                              color: !isGrid ? kBgWhite : kOrange),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          widget.isNotFound
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text(
                      "NO DATA FOUND",
                      style: kDarkContainerStyle,
                    ),
                  ),
                )
              : (widget.products.isNotEmpty)
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            itemCount: widget.products.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                index: index,
                                product: widget.products[index],
                                onTap: () {
                                  // show detail dengan bottom sheet
                                  _showSheet(widget.products, context,
                                      widget.products.length, index);
                                },
                              );
                            },
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.fit(1),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                        ),
                        LoadingBarMoreProduct(isLoadMore: widget.isLoadMore),
                      ],
                    )
                  : Container(
                      height: 250,
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
        ],
      ),
    );
  }

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
