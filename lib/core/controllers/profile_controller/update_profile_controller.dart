import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/apiconfigs/apiconfigs.dart';
import 'package:parking_app_admin/core/models/profile/update_profile_model.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class UpdateProfileController extends GetxController {
  var url = AppUrls.BASE_URL + AppUrls.UPDATE_PROFILE;
  UpdateprofileResModel? updateProfile;
  Dio dio = Dio();
  editProfile({
    required String firstName,
    required String lastName,
  }) async {
    try {
      Map<String, dynamic> data = {
        "first_name": firstName,
        "last_name": lastName
      };
      var res = await ApiProvider().put(url, data);

      if (res.statusCode == 200) {
        log("status code : ${res.statusCode}");
        updateProfile = UpdateprofileResModel.fromJson(res.data);
        log("profile updated : ${updateProfile?.data?.user?.firstName}");
        Get.snackbar("profile updated", "${updateProfile?.message}",
            backgroundColor: kgreencolor);
      } else {
        log(res.statusCode.toString());
        log("Response Body: ${res.data}");
        Get.snackbar("Error", "${updateProfile?.message}",
            backgroundColor: ksecndrycolor);
      }
    } catch (e) {
      log("error updating profile $e");
    }
  }
}
