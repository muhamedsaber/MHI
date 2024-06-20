import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/di/dependency_injection.dart';
import 'package:mhi/features/doctor/appointements/books_count/presentation/Logic/cubit/doctor_books_count_cubit.dart';
import 'package:mhi/features/doctor/appointements/books_count/presentation/widgets/doctor_books_bloc_builder.dart';
import 'package:mhi/features/doctor/home/presentation/widgets/doctor_card.dart';

class DoctorHomeView extends StatefulWidget {
  const DoctorHomeView({super.key});

  @override
  State<DoctorHomeView> createState() => _DoctorHomeViewState();
}

class _DoctorHomeViewState extends State<DoctorHomeView> {
  @override
  void initState() {
    getIt<DoctorBooksCountCubit>().getBooksCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorBooksCountCubit>(),
      child: Scaffold(
        body: Column(
          children: [DoctorCard(), DoctorBooksBlocBuilder()],
        ),
      ),
    );
  }
}
