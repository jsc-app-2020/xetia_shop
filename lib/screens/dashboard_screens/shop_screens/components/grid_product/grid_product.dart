import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';
import 'package:xetia_shop/core/network/product/product_data.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/detail_product/detail_product_dialog.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/components/grid_product/loading_bar_more_product.dart';

class GridProduct extends StatefulWidget {
  final String search;

  const GridProduct({Key key, this.search}) : super(key: key);

  @override
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  bool isGrid = true;
  int selectedIndex = 0;
  int page = 1;
  int pageSearch = 1;
  bool isWaiting = false;
  bool isLoadMore = false;
  bool isLoadByCategory = true;
  bool isSearch = false;
  bool isNotFound = false;
  List<Product> products = [];
  int indexCategory;
  List<dynamic> category;

  void getProductData() async {
    setState(() {
      isLoadByCategory = true;
    });
    try {
      ProductResponse productResponse = await getProduct(page);
      setState(() {
        products = productResponse.response.data;
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
        products.addAll(productResponse.response.data);
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
        products.clear();
        products.addAll(result.response.data);
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
        products.addAll(result.response.data);
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
  Widget build(BuildContext context) {
    return isWaiting
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (!isLoadMore &&
                    notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent) {
                  if (isSearch) {
                    getMoreSearchProduct(++pageSearch, widget.search);
                  } else {
                    getMoreProductData(++page);
                  }
                }
                return true;
              },
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
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
                          Text("5,763 Products",
                              style: kCustomStyle(14, kOrange)),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                    isNotFound
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
                            ? isGrid
                                ? GridLayoutShop(
                                    products: products,
                                    isLoadMore: isLoadMore,
                                  )
                                : ListLayoutShop(
                                    products: products,
                                    isLoadMore: isLoadMore,
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
              ),
            ),
          );
  }
}

class ListLayoutShop extends StatelessWidget {
  const ListLayoutShop({
    Key key,
    @required this.products,
    @required this.isLoadMore,
  }) : super(key: key);

  final List<Product> products;
  final bool isLoadMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListItemShop(
              product: products[index],
              onTap: () {
                _showSheet(products, context, products.length, index);
              },
            );
          },
        ),
        LoadingBarMoreProduct(isLoadMore: isLoadMore),
      ],
    );
  }
}

class ListItemShop extends StatefulWidget {
  const ListItemShop({
    Key key,
    @required this.onTap,
    @required this.product,
  }) : super(key: key);

  final Function onTap;
  final Product product;

  @override
  _ListItemShopState createState() => _ListItemShopState();
}

class _ListItemShopState extends State<ListItemShop> {
  int pcs = 0;

  void addPcs() {
    setState(() {
      pcs++;
    });
  }

  void minPcs() {
    setState(() {
      if (pcs > 0) {
        pcs--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
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
                      widget.product.thumbnail.replaceAll(
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
                            onTap: addPcs,
                          ),
                          SizedBox(height: 4),
                          Text(
                            pcs.toString(),
                            style: kDarkNormalStyle,
                          ),
                          SizedBox(height: 4),
                          MiniButton(
                            icon: FontAwesomeIcons.minus,
                            bgColor: Colors.black,
                            iconColor: Colors.white,
                            onTap: minPcs,
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
                                widget.product.name,
                                style: kCustomBoldStyle(14, Colors.black),
                              ),
                              SizedBox(height: 4),
                              Text(
                                widget.product.weight != null
                                    ? widget.product.weight
                                    : "0",
                                style: kDarkNormalStyle,
                              ),
                              SizedBox(height: 2),
                              Text(
                                "¥${widget.product.price}",
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
      ),
    );
  }
}

class MiniButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function onTap;

  const MiniButton(
      {Key key, this.bgColor, this.iconColor, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}

class GridLayoutShop extends StatelessWidget {
  final List<Product> products;
  final bool isLoadMore;

  const GridLayoutShop({Key key, this.products, this.isLoadMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GridItemShop(
                product: products[index],
                onTap: () {
                  _showSheet(products, context, products.length, index);
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
    );
  }
}

class GridItemShop extends StatelessWidget {
  const GridItemShop({
    Key key,
    @required this.onTap,
    @required this.product,
  }) : super(key: key);

  final Function onTap;
  final Product product;

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
                    product.thumbnail.replaceAll(
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
                  Text(product.name),
                  Text(product.category),
                  Text(product.price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSheet(List<Product> product, BuildContext context, int productLength,
    int indexParent) {
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
