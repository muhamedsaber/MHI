import 'package:flutter/cupertino.dart';
import 'package:mhi/features/common/records/presentation/widgets/shimer_record_content.dart';

class ShimmerRecordListViewBuilder extends StatelessWidget {
  const ShimmerRecordListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ShimmerRecordContent();
            },
          ),
        );
  }
}