import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/model/product/product_response.dart';
import 'package:xetia_shop/screens/products_components/favorite_button.dart';
import 'package:xetia_shop/screens/products_components/info_product.dart';

class ProductCardClick extends StatelessWidget {
  final Product product;
  final Function onTap;

  const ProductCardClick({Key key, this.product, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: CustomIconButton(
              onTap: onTap,
              icon: CupertinoIcons.back,
              color: kOrange,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlusButton(),
                  PlusButton(),
                  PlusButton(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoProduct(product: product),
                  Container(
                    child: AutoSizeText(
                      product.description,
                      style: kNormalStyle.copyWith(fontSize: 16),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        FontAwesomeIcons.plus,
        color: kOrange,
        size: 12,
      ),
    );
  }
}
