import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/booking/presentation/widgets/Times/doctor_times_card.dart';

class DoctorTimesListViewBuilder extends StatefulWidget {
  const DoctorTimesListViewBuilder({super.key, required this.times,
  required this.onTimeSelected
  });
  final List<String> times;
final Function(String)? onTimeSelected;
  @override
  State<DoctorTimesListViewBuilder> createState() =>
      _DoctorTimesListViewBuilderState();
}

class _DoctorTimesListViewBuilderState
    extends State<DoctorTimesListViewBuilder> {
  int? selectedIndex;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Card(
        color: context.theme.colorScheme.surface,
        elevation: 1,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ListView.builder(
          reverse: true,
          itemCount: widget.times.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.onTimeSelected!(widget.times[index]);
                  });
                 
                },
                child: DoctorTimeCard(
                  time: widget.times[index],
                  cardColor: handleCardColor(index),
                  textColor: handleTextColor(index),
                ));
          },
        ),
      ),
    );
  }

  
  Color handleTextColor(int index) {
    if (selectedIndex == index) {
      return Colors.white;
    } else {
      return context.theme.colorScheme.onSurface;
    }
  }

  Color handleCardColor(int index) {
    if (selectedIndex == index) {
      return context.theme.colorScheme.primary;
    } else {
      return context.theme.colorScheme.onSurface.withOpacity(0.1);
    }
  }
}
