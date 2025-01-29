import 'package:get/get.dart';
import 'package:parking_app_admin/views/onboarding/onb1.dart';
import 'package:parking_app_admin/views/onboarding/onboarding.dart';

import '../../../views/home/home.dart';

class SplashController  extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _timerFn();
  }

  _timerFn(){
    Future.delayed(Duration(seconds: 3)).then((value) => Get.to(()=> OnboardingPageView()),);
  }
}