import 'package:flutter/material.dart';

import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';

import 'package:mhi/core/common_ui/widgets/theme_changer.dart';

class PatientSettingsView extends StatelessWidget {
  const PatientSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuilder(context: context, title: "الإعدادات"),
        body: Column(
          children: [const ThemeChanger()],
        ));
  }
}
