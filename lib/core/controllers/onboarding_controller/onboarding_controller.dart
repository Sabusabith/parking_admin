import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  RxBool showback = false.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }
  
}