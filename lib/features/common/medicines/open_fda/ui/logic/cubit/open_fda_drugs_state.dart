

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/common/medicines/open_fda/data/models/drug_result.dart';
part 'open_fda_drugs_state.freezed.dart';
@freezed
class OpenFdaDrugsState with _$OpenFdaDrugsState {
  const factory OpenFdaDrugsState.initial() = _Initial;
  const factory OpenFdaDrugsState.loading() = _Loading;
  const factory OpenFdaDrugsState.loaded(DrugResult result) = _Loaded;
  const factory OpenFdaDrugsState.error(String message) = _Error;
}
