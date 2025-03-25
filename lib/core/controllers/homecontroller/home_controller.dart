import 'package:get/get.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/get_profile_controller.dart';

class HomeController extends GetxController {
  // GetProfileController getProfileController = Get.put(GetProfileController());
  // bottomnavigationbar index
  var selectedIndex = 0.obs;

   void changeIndex(int index) {
    selectedIndex.value = index;
    print(index);
    // selectedIndex.value == 4?getProfileController.fetchProfile():null;
    update();
  }
}
