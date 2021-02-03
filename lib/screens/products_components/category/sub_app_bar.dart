import 'package:flutter/material.dart';

class SubAppBar extends StatelessWidget {
  final Function selected;
  final List category;

  const SubAppBar({Key key, this.selected, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (category != null)
        ? Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(category.length, selected).toList(),
          )
        : Container();
  }
}
