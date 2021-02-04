import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/model/product/product_response.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "¥ ${product.price}",
            style: kNormalStyle.copyWith(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "50%",
                  style: kNormalStyle.copyWith(
                    color: kOrange,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "Rp. 123.456",
                style: kNormalStyle.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
