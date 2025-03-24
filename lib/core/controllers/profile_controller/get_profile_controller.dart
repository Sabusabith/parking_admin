import 'dart:developer';

import 'package:dio/src/response.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/models/profile/get_profile_model.dart';

import '../../apiconfigs/apiconfigs.dart';

class GetProfileController extends GetxController {
  RxBool isLoading = false.obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchProfile();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProfile();
  }

  var url = AppUrls.BASE_URL + AppUrls.GET_PROFILE;
  GetProfileModel? profileModel;
  fetchProfile() async {
    isLoading(true);
    print("profile data: called");

    Response response = await ApiProvider().get(
      url,
    );
    if (response.statusCode == 200) {
      profileModel = GetProfileModel.fromJson(response.data);
      print("profile data: ${profileModel?.data.user.id}");
      isLoading(false);
    } else {
      print(response.data["message"].toString());
    }
  }
}
