import 'package:draggable_widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/components/xetia_bottom_nav_bar.dart';
import 'package:xetia_shop/constants.dart';

class MyDraggableFAB extends StatelessWidget {
  final Function onTap;
  final List<NavBarItem> items;
  final int selectedIndex;

  const MyDraggableFAB({Key key, this.onTap, this.selectedIndex, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableWidget(
      bottomMargin: 50,
      topMargin: 50,
      intialVisibility: true,
      horizontalSapce: 20,
      shadowBorderRadius: 30,
      normalShadow: kShadow[0],
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kOrange,
          ),
          child: Icon(
            items[selectedIndex].selectedIcon,
            color: Colors.white,
          ),
        ),
      ),
      initialPosition: AnchoringPosition.bottomRight,
    );
  }
}
