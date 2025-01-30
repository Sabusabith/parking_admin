import 'package:get/get.dart';

class MyWalletController extends GetxController{
    var isSwitchOn = false.obs; 

  void toggleSwitch(bool value) {
    isSwitchOn.value = value; 
  }
}