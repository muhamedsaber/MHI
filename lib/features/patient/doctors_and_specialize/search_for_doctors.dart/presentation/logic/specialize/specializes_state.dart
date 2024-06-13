part of 'specializes_cubit.dart';

@freezed
class SpecializesState with _$SpecializesState {
  const factory SpecializesState.initial() = _Initial;
  const factory SpecializesState.loading() = Loading;
  const factory SpecializesState.success(List<SpecializeModel> specializations) = Success;
  const factory SpecializesState.error(String message) = Error;

}
