import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/models/mhi_medicine_model.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/repos/mhi_medicine_repo.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/presentation/Logic/mhi_medicines/cubit/mhi_medicines_state.dart';

class MhiMedicinesCubit extends Cubit<MhiMedicinesState> {
  MhiMedicinesCubit({required this.repo})
      : super(const MhiMedicinesState.initial());
  final MhiMedicineRepo repo;
  List<MhiMedicineData> allMedicines = [];
  getMedicines() async {
    emit(const MhiMedicinesState.loading());
    ApiResult<MhiMedicineModel> model = await repo.getMedicines();
    model.when(success: (MhiMedicineModel model) {
      emit(MhiMedicinesState.loaded(model));
      allMedicines = model.medicineData;
    }, failure: (message) {
      emit(MhiMedicinesState.error(
          message.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  filterMdicines(String? input) async {
    if (input.isNullOrEmpty()) {
      emit(MhiMedicinesState.loaded(
          MhiMedicineModel(medicineData: allMedicines)));
    } else {
      List<MhiMedicineData> filteredMedicines = allMedicines
          .where(
            (element) => element.name!.contains(input!),
          )
          .toList();
      emit(
        MhiMedicinesState.loaded(
          MhiMedicineModel(medicineData: filteredMedicines),
        ),
      );
    }
  }
}
