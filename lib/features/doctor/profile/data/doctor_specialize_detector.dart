import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/models/specialize_model.dart';

class DoctorSpeciaizeDetector {
  DoctorSpeciaizeDetector._();
 static String detectSpeciaizeName(String? specializeId) {
    String specializeName = "";
    List<SpecializeModel> models =
        List.from(specializes.map((e) => SpecializeModel.fromJson(e)));
    for (var element in models) {
      if (element.id == specializeId) {
        specializeName = element.name;
        break;
      } else {
        specializeName = specializeId??"غير معرف";
      }
    }
    return specializeName;
  }
}

// static specializes
List specializes = [
  {"_id": "663f57982ca058ff9d297721", "name": " ممارس عام ", "__v": 0},
  {"_id": "663f57aa2ca058ff9d297723", "name": " أسنان ", "__v": 0},
  {"_id": "663f57b72ca058ff9d297725", "name": " نساء وتوليد ", "__v": 0},
  {"_id": "663f57d32ca058ff9d297727", "name": " أطفال ", "__v": 0},
  {"_id": "663f57da2ca058ff9d297729", "name": " عيون  ", "__v": 0},
  {"_id": "663f58032ca058ff9d29772b", "name": " انف و اذن و حنجرة  ", "__v": 0},
  {"_id": "663f58182ca058ff9d29772d", "name": " جلدية   ", "__v": 0},
  {"_id": "663f58292ca058ff9d29772f", "name": " أمراض صدرية  ", "__v": 0},
  {"_id": "663f58402ca058ff9d297731", "name": " أمراض عصبية ", "__v": 0},
  {"_id": "663f58562ca058ff9d297733", "name": " أمراض روماتيزمية ", "__v": 0},
  {"_id": "663f58622ca058ff9d297735", "name": "  أورام  ", "__v": 0},
  {"_id": "663f586e2ca058ff9d297737", "name": "  قلب  ", "__v": 0},
  {"_id": "663f58822ca058ff9d297739", "name": "  جهاز هضمي  ", "__v": 0},
  {"_id": "663f58982ca058ff9d29773b", "name": " غدد صماء ", "__v": 0},
  {"_id": "663f58b22ca058ff9d29773d", "name": " أمراض دم ", "__v": 0},
  {"_id": "663f595b2ca058ff9d29773f", "name": " جراحة عامة ", "__v": 0},
  {
    "_id": "663f59712ca058ff9d297741",
    "name": " جراحة قلب وأوعية دموية ",
    "__v": 0
  },
  {"_id": "663f59902ca058ff9d297743", "name": " جراحة عظام  ", "__v": 0},
  {"_id": "663f59972ca058ff9d297745", "name": " جراحة تجميل   ", "__v": 0},
  {
    "_id": "663f59a12ca058ff9d297747",
    "name": " جراحة أوعية دموية   ",
    "__v": 0
  },
  {"_id": "663f59c02ca058ff9d297749", "name": " تخدير  ", "__v": 0},
  {"_id": "663f59e42ca058ff9d29774b", "name": " أمراض جهاز تنفسي  ", "__v": 0},
  {"_id": "663f59f22ca058ff9d29774d", "name": " جراحة أطفال ", "__v": 0},
  {"_id": "663f5a0c2ca058ff9d29774f", "name": " علاج طبيعي ", "__v": 0},
  {"_id": "663f5a272ca058ff9d297751", "name": " أشعة ", "__v": 0},
  {"_id": "663f5a332ca058ff9d297753", "name": " أشعة تداخلية ", "__v": 0}
];
