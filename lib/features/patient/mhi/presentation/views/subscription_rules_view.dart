import 'package:flutter/material.dart';
import 'package:mhi/core/common_ui/widgets/appbar_builder.dart';
import 'package:mhi/core/helper/app_strings.dart';
import 'package:mhi/core/helper/spacing.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SubscriptionRolesView extends StatelessWidget {
  const SubscriptionRolesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarBuilder(context: context, title: "الإشتراك في التأمين الصحي"),
      body: Column(
        children: [
          verticleSpace(20),
          Expanded(child: SfPdfViewer.asset(AppStrings.lawsPdf))
        ],
      ),
    );
  }
}
