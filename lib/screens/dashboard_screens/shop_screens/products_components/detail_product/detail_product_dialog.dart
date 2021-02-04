import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:xetia_shop/components/my_button.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/products_components/detail_product/four_rectangle_button.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/products_components/detail_product/title_detail.dart';
import 'package:xetia_shop/screens/dashboard_screens/shop_screens/products_components/rating_bar.dart';

import 'add_or_remove_product.dart';

class DetailProductDialog extends StatefulWidget {
  final Product product;
  final BuildContext mContext;

  const DetailProductDialog({Key key, this.product, this.mContext})
      : super(key: key);

  @override
  _DetailProductDialogState createState() => _DetailProductDialogState();
}

class _DetailProductDialogState extends State<DetailProductDialog> {
  int productCount = 1;
  bool isFavorite = false;
  MediaQueryData queryData;

  void productAdd() {
    setState(() {
      productCount += 1;
    });
  }

  void productRemove() {
    setState(() {
      if (productCount > 1) {
        productCount -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgWhite,
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: ModalScrollController.of(widget.mContext),
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  Stack(
                    children: [
                      // widget untuk thumbnail detail
                      AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Container(
                          child: Image.network(
                            widget.product.thumbnail.replaceAll(
                                "https://storage.googleapis.com/jsc-product-images/http",
                                "https"),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      // widget cross button untuk close modal
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(),
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 5)
                                ]),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_rounded,
                              color: kRed,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: kBoxDecoration(kOrange),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleDetail(
                          product: widget.product,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    RatingBarExpanded(rate: 4),
                                    RatingBarExpanded(rate: 4),
                                    RatingBarExpanded(rate: 4),
                                    RatingBarExpanded(rate: 4),
                                  ],
                                )),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  AddOrRemoveProduct(
                                                    onTap: productAdd,
                                                    icon: FontAwesomeIcons.plus,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    child: Center(
                                                      child: Text(
                                                        productCount.toString(),
                                                        style: kNormalStyle,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  AddOrRemoveProduct(
                                                    onTap: productRemove,
                                                    icon:
                                                        FontAwesomeIcons.minus,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            FourRectangleButton(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            AddOrRemoveProduct(
                                              onTap: () {},
                                              icon: FontAwesomeIcons.user,
                                            ),
                                            AddOrRemoveProduct(
                                              onTap: () {},
                                              icon: FontAwesomeIcons.box,
                                            ),
                                            AddOrRemoveProduct(
                                              onTap: () {},
                                              icon: FontAwesomeIcons.language,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // height: 300,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kBgWhite,
                      // borderRadius:
                      //     BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reviews",
                              style: kDarkNormalStyle,
                            ),
                            Text(
                              "See All Reviews",
                              style: kNormalStyle.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "4.8",
                                      style: kDarkNormalStyle,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "9 Reviews",
                                style: kNormalStyle.copyWith(color: kOrange),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "4.8",
                                      style: kDarkNormalStyle,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "9 Reviews",
                                style: kNormalStyle.copyWith(color: kOrange),
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
          //Buy Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: kBgWhite,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(0, 0),
                        blurRadius: 4)
                  ]),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      decoration: kBoxDecoration(kOrange),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: kOrange,
                        shape: kRoundedBorder,
                        child: Icon(
                          Icons.shop,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: MyButton(
                        onTap: () {},
                        color: kOrange,
                        text: "Buy",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
