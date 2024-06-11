import 'package:flutter/material.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/widgets/doctors/saved_doctors_tab.dart';

class TabsSavedContentBody extends StatelessWidget {
  const TabsSavedContentBody({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
  
          Container(
            color: Colors.green,
          ),
          const SavedDoctorsTab(),
        ],
      ),
    );
  }
}
