import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/model/product/product_response.dart';
import 'package:xetia_shop/screens/products_components/product_price.dart';

class TitleDetail extends StatelessWidget {
  const TitleDetail({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          AutoSizeText(
            product.name,
            style: kDarkContainerStyle,
            maxLines: 3,
            minFontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
          ProductPrice(product: product),
          Container(
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: kNormalStyle.copyWith(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
