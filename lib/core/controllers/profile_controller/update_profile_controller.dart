import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/apiconfigs/apiconfigs.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/get_profile_controller.dart';
import 'package:parking_app_admin/core/models/profile/update_profile_model.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class UpdateProfileController extends GetxController {
  RxBool isLoading = false.obs;
  GetProfileController controller = Get.put(GetProfileController());

  var url = AppUrls.BASE_URL + AppUrls.UPDATE_PROFILE;
  UpdateprofileResModel? updateProfile;
  Dio dio = Dio();
  editProfile(Map data) async {
    isLoading(true);
    isLoading.value ? _onLoading() : null;
    try {
      Map<String, dynamic> bodyData = {
        "first_name": data["first_name"],
        "last_name": data["last_name"]
      };
      print("body data   ${data["first_name"]} ${data["last_name"]}");
      var res = await ApiProvider().put(url, bodyData);

      if (res.statusCode == 200) {
        updateProfile = UpdateprofileResModel.fromJson(res.data);
        log("profile updated : ${updateProfile?.data?.user?.firstName} ${updateProfile?.data?.user?.lastName}");
        isLoading(false);
        log("profile updated in the edit page");

        await controller.fetchProfile();
        Get.back();

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
      Get.snackbar("Error", "Failed to update profile",
          backgroundColor: Colors.red);
    }
  }

  void _onLoading() {
    isLoading.value
        ? showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Dialog(
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 25),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: kprimerycolor,
                                strokeWidth: 2,
                              ),
                            )),
                        SizedBox(width: 15),
                        Text(
                          "Updating Profile .....",
                          style: GoogleFonts.publicSans(
                              color: Colors.grey.shade900),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : null;
  }
}
