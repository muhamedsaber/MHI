import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/app_textstyles.dart';
import 'package:mhi/features/doctor/appointements/books_count/data/models/doctor_books_count_response_body.dart';

class DoctorBooksCountGridview extends StatelessWidget {
  const DoctorBooksCountGridview({super.key, required this.responseBody});
  final DoctorBooksCountResponseBody responseBody;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.7),
        semanticChildCount: 30,
        children: [
          customBooksCard(
              context: context,
              title: "الحجوزات المكتملة",
              value: responseBody.done),
          customBooksCard(
              context: context,
              title: "الحجوزات الجديدة",
              value: responseBody.waiting),
          customBooksCard(
              context: context, title: "المجموع الكلي", value: totalCounts()),
          customBooksCard(
              context: context,
              title: "الحجوزات الملغية",
              value: responseBody.cancelled),
        ],
      ),
    );
  }

  Widget customBooksCard(
      {required String title,
      required int? value,
      required BuildContext context}) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.jannat14OnSurface(context)
                .copyWith(fontSize: 16.sp),
          ),
          Text(
            value == null ? "غير معرف" : value.toString(),
            style: AppTextStyles.jannat14OnSurface(context)
                .copyWith(fontSize: 30.sp),
          ),
        ],
      ),
    );
  }

  int totalCounts() {
    int done = responseBody.done ?? 0;
    int cancelled = responseBody.cancelled ?? 0;
    int waiting = responseBody.waiting ?? 0;
    return (done + waiting + cancelled);
  }
}
