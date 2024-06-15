import 'package:flutter/material.dart';

import 'package:mhi/features/patient/patient_saved_data/presentation/widgets/appbar_for_saved_patient_data.dart';
import 'package:mhi/features/patient/patient_saved_data/presentation/widgets/tabs_saved_content.dart';

class SavedDataView extends StatefulWidget {
  const SavedDataView({super.key});

  @override
  State<SavedDataView> createState() => _SavedDataViewState();
}

class _SavedDataViewState extends State<SavedDataView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 1, vsync: this, initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarForSavedPatientData(
            tabController: _tabController,
          ),
          TabsSavedContentBody(
            tabController: _tabController,
          )
        ],
      ),
    );
  }
}
