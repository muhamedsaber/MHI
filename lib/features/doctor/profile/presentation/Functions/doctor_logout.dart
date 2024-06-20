import 'package:mhi/config/database/cache/cache_helper.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/constants/database_constants.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';

class DoctorLogout {
  static logoutDoctor() async {
    Alerts().showCustomToast(
        color: AppColors.lightGreen, message: "جاري تسجيل الخروج");
    await DoctorCache().removeUser();
    await CacheHelper.setData(
        key: DatabaseConstants.isDoctorLoggedIn, value: false);
  }
}
