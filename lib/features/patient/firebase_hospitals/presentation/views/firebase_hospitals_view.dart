import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/common_ui/widgets/search_textfield.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/logic/cubit/firebase_hospitals_cubit.dart';
import 'package:mhi/features/patient/firebase_hospitals/presentation/widgets/firebase_hospitals_bloc_builder.dart';

class FirebaseHospitalsView extends StatefulWidget {
  const FirebaseHospitalsView({super.key});

  @override
  State<FirebaseHospitalsView> createState() => _FirebaseHospitalsViewState();
}

class _FirebaseHospitalsViewState extends State<FirebaseHospitalsView> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(context: context, title: "المستشفيات"),
      body: Column(
        children: [
          verticleSpace(10),
          SearchTextField(
            controller: controller,
            hintText: "ادخل إسم المستشفي",
            onChanged: (input) {
              getIt<FirebaseHospitalsCubit>().filterHospitals(input);
            },
          ),
          verticleSpace(4),
          const FirebaseHospitalsBlocBuilder(),
        ],
      ),
    );
  }
}
