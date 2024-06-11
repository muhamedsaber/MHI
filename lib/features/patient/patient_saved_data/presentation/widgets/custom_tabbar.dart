import 'package:flutter/material.dart';
import 'package:mhi/core/helper/app_textstyles.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {super.key, required this.tabController, required this.tabs});

  final TabController tabController;
  final List<Tab> tabs;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.red,
      labelStyle: AppTextStyles.jannat18BoldWhite,
      dividerColor: Colors.transparent,
      controller: widget.tabController,
      tabs: widget.tabs,
    );
  }
}
