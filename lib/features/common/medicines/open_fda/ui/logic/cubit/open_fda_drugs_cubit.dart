import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/features/common/medicines/open_fda/data/repos/auto_openfda_drug_repo.dart';
import 'package:mhi/features/common/medicines/open_fda/data/repos/random_openfda_drug_repo.dart';
import 'package:mhi/features/common/medicines/open_fda/ui/logic/cubit/open_fda_drugs_state.dart';

class OpenFdaDrugsCubit extends Cubit<OpenFdaDrugsState> {
  OpenFdaDrugsCubit({
    required this.randomOpenfdaDrugRepo,
    required this.autoRepo
  }) : super(const OpenFdaDrugsState.initial());

  final RandomOpenfdaDrugRepo randomOpenfdaDrugRepo;
  final AutoOpenfdaDrugRepo autoRepo;
  getRandomDrugs() {
    emit(const OpenFdaDrugsState.loading());
    randomOpenfdaDrugRepo.getRandomDrugs(limit: 50).then((value) {
      value.when(success: (data) {
        emit(OpenFdaDrugsState.loaded(data));
        log("emitted");
      }, failure: (error) {
        emit(OpenFdaDrugsState.error(
            error.apiErrorModel.message ?? "حدث خطأ ما"));
      });
    });
  }
  getAutoCompleteDrugs(String query) async {
    emit(const OpenFdaDrugsState.loading());

    autoRepo.autoSearch(limit: 20, search: query).then((value) {
      value.when(success: (data) {
        emit(OpenFdaDrugsState.loaded(data));
      }, failure: (error) {
        emit(OpenFdaDrugsState.error(
            error.apiErrorModel.message ?? "حدث خطأ ما"));
      });
    });
  }

}
