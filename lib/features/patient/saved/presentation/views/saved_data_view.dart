import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/common_ui/widgets/main_app_bar.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/core/helper/theming.dart';
import 'package:mhi/features/patient/saved/presentation/widgets/custom_tabbar.dart';
import 'package:mhi/features/patient/saved/presentation/widgets/saved_doctors_tab.dart';

class SavedDataView extends StatefulWidget {
  const SavedDataView({super.key});

  @override
  State<SavedDataView> createState() => _SavedDataViewState();
}

class _SavedDataViewState extends State<SavedDataView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this, initialIndex: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainAppBar(
            gradient: AppThemeing.patientGradient,
            widget: Padding(
              padding: EdgeInsets.only(top: 49.h),
              child: CustomTabBar(
                tabController: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      "التقارير",
                      style: AppTextStyles.jannat18BoldWhite,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "مستشفيات",
                      style: AppTextStyles.jannat18BoldWhite,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "الأطباء",
                      style: AppTextStyles.jannat18BoldWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                const SavedDoctorsTabe(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
