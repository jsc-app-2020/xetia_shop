import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/detail_product/detail_product_dialog.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/grid_product/loading_bar_more_product.dart';

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
                  ? isGrid
                      ? GridLayoutShop(widget: widget)
                      : ListLayoutShop(widget: widget)
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
}

class ListLayoutShop extends StatelessWidget {
  const ListLayoutShop({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final GridProduct widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: widget.products.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListItemShop(widget: widget, index: index);
          },
        ),
        LoadingBarMoreProduct(isLoadMore: widget.isLoadMore),
      ],
    );
  }
}

class ListItemShop extends StatelessWidget {
  const ListItemShop({
    Key key,
    @required this.widget,
    @required this.index,
  }) : super(key: key);

  final GridProduct widget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    widget.products[index].thumbnail.replaceAll(
                        "https://storage.googleapis.com/jsc-product-images/http",
                        "http"),
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MiniButton(
                          icon: FontAwesomeIcons.plus,
                          bgColor: Colors.black,
                          iconColor: Colors.white,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "2",
                          style: kDarkNormalStyle,
                        ),
                        SizedBox(height: 4),
                        MiniButton(
                          icon: FontAwesomeIcons.minus,
                          bgColor: Colors.black,
                          iconColor: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sariraya Frozen Meatball",
                              style: kCustomBoldStyle(14, Colors.black),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "500 gr",
                              style: kDarkNormalStyle,
                            ),
                            SizedBox(height: 2),
                            Text(
                              "¥1200",
                              style: kDarkNormalStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MiniButton(
                        iconColor: Colors.white,
                        bgColor: kOrange,
                        icon: Icons.favorite_border),
                    SizedBox(width: 15),
                    MiniButton(
                        iconColor: Colors.white,
                        bgColor: kOrange,
                        icon: CupertinoIcons.cart),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        decoration: kBoxDecoration(kOrange),
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            "Buy",
                            style: kDarkNormalStyle,
                          ),
                        ),
                      ),
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

class MiniButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final IconData icon;

  const MiniButton({Key key, this.bgColor, this.iconColor, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: bgColor,
      ),
      padding: EdgeInsets.all(3),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}

class GridLayoutShop extends StatelessWidget {
  final GridProduct widget;

  const GridLayoutShop({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: widget.products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GridItemShop(
                widget: widget,
                index: index,
                onTap: () {
                  _showSheet(
                      widget.products, context, widget.products.length, index);
                },
              );
            },
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
        ),
        LoadingBarMoreProduct(isLoadMore: widget.isLoadMore),
      ],
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

class GridItemShop extends StatelessWidget {
  const GridItemShop({
    Key key,
    @required this.widget,
    @required this.index,
    @required this.onTap,
  }) : super(key: key);

  final GridProduct widget;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.products[index].thumbnail.replaceAll(
                        "https://storage.googleapis.com/jsc-product-images/http",
                        "http"),
                    fit: BoxFit.cover,
                    height: 200,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(widget.products[index].name),
                  Text(widget.products[index].category),
                  Text(widget.products[index].price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
