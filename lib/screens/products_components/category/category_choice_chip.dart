import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

class CategoryChoiceChip extends StatelessWidget {
  final dynamic widget;
  final int index;
  final int value;
  final Function onSelected;
  final dynamic category;

  const CategoryChoiceChip(
      {Key key,
      this.widget,
      this.index,
      this.value,
      this.onSelected,
      this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
        shadowColor: Colors.black.withOpacity(0.5),
        elevation: 5,
        labelStyle: widget.isDark || value == index
            ? kNormalStyle
            : kDarkNormalStyle.copyWith(color: kOrange),
        backgroundColor: Colors.white,
        label: Text(category.name),
        selectedColor: kOrange,
        selected: value == index,
        onSelected: onSelected,
      ),
    );
  }
}
