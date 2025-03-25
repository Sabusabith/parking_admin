import 'package:dio/src/response.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/models/profile/get_profile_model.dart';

import '../../apiconfigs/apiconfigs.dart';

class GetProfileController extends GetxController {
  var isLoading = false.obs;
  RxString firstname = "".obs;
  RxString lastname = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProfile();
    super.onInit();
  }

  var url = AppUrls.BASE_URL + AppUrls.GET_PROFILE;
  GetProfileModel? profileModel;
  fetchProfile() async {
    try {
      isLoading.value = true;
      print("profile data: called");

      Response response = await ApiProvider().get(url);

      if (response.statusCode == 200) {
        profileModel = GetProfileModel.fromJson(response.data);

        // Handle null values correctly before converting to string
        firstname.value = profileModel?.data.user.firstName != null &&
                profileModel!.data.user.firstName!.trim().isNotEmpty
            ? profileModel!.data.user.firstName!
            : "N/A"; // Default name

        lastname.value = profileModel?.data.user.lastName != null &&
                profileModel!.data.user.lastName!.trim().isNotEmpty
            ? profileModel!.data.user.lastName!
            : ""; // Default last name (empty)

        print("User name: ${firstname.value} ${lastname.value}");
      } else {
        print("Error: ${response.data["message"]}");
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      isLoading.value = false;
      update();
    }
  }





  
}
