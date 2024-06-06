// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:mhi/core/utils/app_strings.dart';
// import 'package:mhi/core/utils/app_textstyles.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// // class DoctorBottomNavBar extends StatefulWidget {
// //   const DoctorBottomNavBar({super.key});

// //   @override
// //   State<DoctorBottomNavBar> createState() => _DoctorBottomNavBarState();
// // }

// // class _DoctorBottomNavBarState extends State<DoctorBottomNavBar> {
// //   late PersistentTabController _controller;
// //   @override
// //   void initState() {
// //     _controller = PersistentTabController(initialIndex: 2);
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     List<Widget> _buildScreens() {
// //       return [
// //         const DoctorProfileView(),
// //         const DoctorAppointementView(),
// //         const DoctorHomeView()
// //       ];
// //     }

// //     List<PersistentBottomNavBarItem> _navBarsItems() {
// //       return [
// //         PersistentBottomNavBarItem(
// //           icon: const Icon(Icons.account_circle_rounded),
// //           title: (AppStrings.yourProfile),
// //           textStyle: AppTextStyles.jannat18ExtraBold,
// //           activeColorPrimary: Colors.white,
// //           inactiveColorPrimary: Colors.white,
// //           activeColorSecondary: LightThemeColors.lighBlue,
// //         ),
// //         PersistentBottomNavBarItem(
// //           icon: const Icon(Icons.schedule_sharp),
// //           title: (AppStrings.myAppoitments),
// //           textStyle: AppTextStyles.jannat18ExtraBold,
// //           activeColorPrimary: Colors.white,
// //           inactiveColorPrimary: Colors.white,
// //           activeColorSecondary: LightThemeColors.lighBlue,
// //         ),
// //         PersistentBottomNavBarItem(
// //             icon: const Icon(
// //               Icons.home,
// //             ),
// //             title: (AppStrings.homePage),
// //             textStyle: AppTextStyles.jannat18ExtraBold,
// //             activeColorPrimary: Colors.white,
// //             inactiveColorPrimary: Colors.white,
// //             activeColorSecondary: LightThemeColors.lighBlue),
// //       ];
// //     }

// //     return PersistentTabView(
// //       margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
// //       context,
// //       controller: _controller,
// //       screens: _buildScreens(),
// //       items: _navBarsItems(),
// //       confineInSafeArea: true,
    
// //       handleAndroidBackButtonPress: true, // Default is true.
// //       resizeToAvoidBottomInset:
// //           true, 
// //       stateManagement: true, // Default is true.
// //       hideNavigationBarWhenKeyboardShows:
// //           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
// //       decoration: NavBarDecoration(
// //         borderRadius: BorderRadius.circular(1000.0),
// //         colorBehindNavBar: Colors.white,
// //         gradient: const LinearGradient(colors: [
// //           AppColors.lighPurple,
// //           AppColors.lighBlue,
// //         ]),
// //       ),
// //       popAllScreensOnTapOfSelectedTab: true,
// //       popActionScreens: PopActionScreensType.all,
// //       itemAnimationProperties: const ItemAnimationProperties(
// //         // Navigation Bar's items animation properties.
// //         duration: Duration(milliseconds: 200),
// //         curve: Curves.ease,
// //       ),
// //       onItemSelected: (value) {
// //         if (value == 1) {
// //           BlocProvider.of<GetDoctorAppointementCubit>(context)
// //               .getDoctorAppointement();
// //         }
// //       },
// //       screenTransitionAnimation: const ScreenTransitionAnimation(
// //         // Screen transition animation on change of selected tab.
// //         animateTabTransition: true,
// //         curve: Curves.ease,
// //         duration: Duration(milliseconds: 200),
// //       ),
// //       navBarStyle:
// //           NavBarStyle.style7, // Choose the nav bar style with this property.
// //     );
// //   }
// // }
