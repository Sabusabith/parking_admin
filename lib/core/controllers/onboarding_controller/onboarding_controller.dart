import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }
}