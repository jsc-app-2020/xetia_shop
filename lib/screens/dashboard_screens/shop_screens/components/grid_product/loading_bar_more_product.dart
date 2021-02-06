import 'package:flutter/material.dart';

class LoadingBarMoreProduct extends StatelessWidget {
  final bool isLoadMore;

  const LoadingBarMoreProduct({Key key, this.isLoadMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoadMore
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }
}
