import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/doctor/create_new_record/data/models/new_record_request_body.dart';
import 'package:mhi/features/doctor/create_new_record/data/repo/create_new_record_repo.dart';
import 'package:mhi/features/doctor/create_new_record/presentation/cubit/create_new_record_state.dart';

class CreateNewRecordCubit extends Cubit<CreateNewRecordState> {
  CreateNewRecordCubit({required this.repo})
      : super(const CreateNewRecordState.initial());
  final CreateNewRecordRepo repo;

  TextEditingController diagnoseController = TextEditingController();
  TextEditingController medicineController = TextEditingController();

  Future<String> _getDoctorId() async {
    DoctorModel? model = await DoctorCache().getUser();
    return model?.id ?? "";
  }

  List<Diagnose> diagnoses = [];
  createNewRecord({required String patientId}) async {
    try {
      String doctorId = await _getDoctorId();
      if (diagnoses.isEmpty) {
        Alerts().showCustomToast(
            message: "يجب اضافة تشخيص واحد علي الأقل",
            color: AppColors.lightRed);
      } else {
        emit(const CreateNewRecordState.loading());
        await repo.createNewRecord(NewRecordRequestBody(
            patientID: patientId, doctorID: doctorId, diagnose: diagnoses));
        diagnoses.clear();
        emit(CreateNewRecordState.diagnoseUpdated(List.from(diagnoses)));

        emit(const CreateNewRecordState.success("تم إنشاء التقرير بنجاح"));
      }
    } catch (e) {
      emit(CreateNewRecordState.error(e.toString()));
    }
  }

  void addDiagnose() {
    if (diagnoseController.text.isNotEmpty &&
        medicineController.text.isNotEmpty) {
      diagnoses.add(Diagnose(
        description: diagnoseController.text,
        medicine: medicineController.text,
      ));
      diagnoseController.clear();
      medicineController.clear();
      emit(CreateNewRecordState.diagnoseUpdated(List.from(diagnoses)));
    }
  }

  removeDiagnose(Diagnose diagnose) {
    diagnoses.remove(diagnose);
    emit(CreateNewRecordState.diagnoseUpdated(List.from(diagnoses)));
  }
}
