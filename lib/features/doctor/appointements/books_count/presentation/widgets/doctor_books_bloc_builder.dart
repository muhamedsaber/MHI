import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/features/doctor/appointements/books_count/presentation/Logic/cubit/doctor_books_count_cubit.dart';
import 'package:mhi/features/doctor/appointements/books_count/presentation/Logic/cubit/doctor_books_count_state.dart';
import 'package:mhi/features/doctor/appointements/books_count/presentation/widgets/doctor_books_count_grid_view.dart';

class DoctorBooksBlocBuilder extends StatelessWidget {
  const DoctorBooksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBooksCountCubit, DoctorBooksCountState>(
      builder: (context, state) {
        return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            success: (data) => DoctorBooksCountGridview(responseBody: data),
            error: (error) => NoDataFound(message: error));
      },
    );
  }
}
