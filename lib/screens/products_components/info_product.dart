import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/model/product/product_response.dart';
import 'package:xetia_shop/screens/products_components/product_price.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //AutoSizeText, untuk memberikan ukuran text secara otomatis.
            AutoSizeText(
              product.name,
              style: kNormalStyle.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              minFontSize: 12,
            ),
            ProductPrice(product: product),
          ],
        ),
      ),
    );
  }
}
