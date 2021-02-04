import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar, this.isDark, this.color);

  final TabBar _tabBar;
  final bool isDark;
  final Color color;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      decoration:
          BoxDecoration(color: isDark ? kGrey : Colors.white, boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5),
      ]),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return isDark != oldDelegate.isDark || Colors.white != oldDelegate.color;
  }
}
