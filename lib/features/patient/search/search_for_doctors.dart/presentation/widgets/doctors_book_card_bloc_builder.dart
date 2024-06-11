import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/common_ui/widgets/no_data_found.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/logic/doctors/book_doctors_cubit.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctor_book_card_list_view_builder.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/presentation/widgets/doctors_shimmer_listviewbuilder.dart';

class DoctorsBookCardBlocBuilder extends StatelessWidget {
  const DoctorsBookCardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDoctorsCubit, BookDoctorsState>(
      builder: (context, state) {
        if (state is BookDoctorsInitial) {
          return const DoctorShimmerListViewBuilder();
        }
        if (state is BookDoctorsLoading) {
          return const DoctorShimmerListViewBuilder();
        }
        if (state is BookDoctorsLoaded) {
          if (state.doctors.doctors.isEmpty) {
            return const NoDataFound(
              message: "لم يتم العثور علي أطباء",
            );
          }
          return DoctorBookCardListViewBuilder(
            model: state.doctors,
          );
        } else if (state is BookDoctorsError) {
          return NoDataFound(message: state.message);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
