
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/models/mhi_medicine_model.dart';
part 'mhi_medicines_state.freezed.dart';
@freezed
class MhiMedicinesState with _$MhiMedicinesState {
  const factory MhiMedicinesState.initial() = _Initial;
  const factory MhiMedicinesState.loading() = _Loading;
  const factory MhiMedicinesState.loaded(MhiMedicineModel model) = _Loaded;
  const factory MhiMedicinesState.error(String message) = _Error;

}
