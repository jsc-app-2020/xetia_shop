import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

class SliverShiftingAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverShiftingAppBarDelegate(this._tabBar);

  final ShiftingTabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(SliverShiftingAppBarDelegate oldDelegate) {
    return false;
  }
}
