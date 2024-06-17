import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/config/Theme/theme_colors.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/doctor/home/presentation/views/doctor_home_view.dart';
import 'package:mhi/features/doctor/profile/presentation/views/doctor_profile_view.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DoctorBottomNavBar extends StatefulWidget {
  const DoctorBottomNavBar({super.key});

  @override
  State<DoctorBottomNavBar> createState() => _DoctorBottomNavBarState();
}

class _DoctorBottomNavBarState extends State<DoctorBottomNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        const DoctorProfileView(),
        const DoctorHomeView(),
        const DoctorHomeView()
      ];
    }

    return PersistentTabView(
      margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15),
      context,
      controller: _controller,
      screens: buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1000.0),
        colorBehindNavBar: Colors.white,
        gradient: AppThemeing.doctorGredient2,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
            spreadRadius: 20,
            blurRadius: 10,
            offset: const Offset(0, 8),
          )
        ],
      ),
      onItemSelected: (value) {},
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      title: ("صفحتك"),
      textStyle: AppTextStyles.jannat18BoldWhite,
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: LightThemeColors.lighBlue,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.schedule),
      title: ("مواعيدي"),
      textStyle: AppTextStyles.jannat18BoldWhite,
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: LightThemeColors.lighBlue,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.home,
      ),
      title: (AppStrings.homePage),
      textStyle: AppTextStyles.jannat18BoldWhite,
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: LightThemeColors.lighBlue,
    ),
  ];
}
