import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/model/product/product_response.dart';
import 'package:xetia_shop/screens/products_components/favorite_button.dart';
import 'package:xetia_shop/screens/products_components/grid_product/product_card_click.dart';
import 'package:xetia_shop/screens/products_components/info_product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final Function onTap;
  final int index;

  const ProductCard({Key key, this.product, this.onTap, this.index})
      : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isShowMore = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    //menggunakan variable isShowMore untuk mengetahui ketika favorite button di klik
    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: Container(
          height: widget.index.isOdd ? 320 : 310,
          // width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: kOrange,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5),
            ],
          ),
          child: isShowMore
              ? ProductCardClick(
                  onTap: () {
                    setState(() {
                      isShowMore = false;
                    });
                  },
                  product: widget.product,
                )
              : Stack(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        widget.product.thumbnail.replaceAll(
                            "https://storage.googleapis.com/jsc-product-images/http",
                            "https"),
                        fit: BoxFit.cover,
                        height: 160,
                        width: double.infinity,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 140),
                      child: Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: CustomIconButton(
                              onTap: () {
                                setState(() {
                                  isShowMore = true;
                                });
                              },
                              icon: CupertinoIcons.back,
                              color: kOrange,
                            ),
                          ),
                          Expanded(
                            child: InfoProduct(product: widget.product),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CustomIconButton(
                        color: isFavorite ? Colors.red : Colors.grey,
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
