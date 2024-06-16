import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/cubit/toggle_doctor_hospital_cubit.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/search/doctors_list_header.dart';
import 'package:mhi/features/patient/hospitals/presentation/widgets/search/search_for_doctors_textfield.dart';

class SearchForDoctorsChanger extends StatefulWidget {
  const SearchForDoctorsChanger({super.key});

  @override
  State<SearchForDoctorsChanger> createState() =>
      _SearchForDoctorsChangerState();
}

class _SearchForDoctorsChangerState extends State<SearchForDoctorsChanger> {
  bool isSearchStarted = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: isSearchStarted
          ? SearchForDoctorsTextField(
              onCloseButtonPressed: () {
                triggerSearch();
                context.read<ToggleDoctorHospitalCubit>().showHospitals();
              },
            )
          : DoctorListHeader(
              toggleSearch: () {
                triggerSearch();
                context.read<ToggleDoctorHospitalCubit>().hideHospital();
              },
            ),
    );
  }

  triggerSearch() {
    setState(() {
      isSearchStarted = !isSearchStarted;
    });
  }
}
