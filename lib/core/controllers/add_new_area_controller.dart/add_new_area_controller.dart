import 'package:get/get.dart';

class AddNewAreaController extends GetxController {
  var isSwitchOneOn = false.obs;
  var isSwitchTwoOn = false.obs;
  var isSwitchThreeOn = false.obs;
  var isSwitchFourOn = false.obs;
  var isSwitchFiveOn = false.obs;
  var isSwitchSixOn = false.obs;
  var isSwitchSevenOn = false.obs;

  void toggleSwitchOne(bool value) {
    isSwitchOneOn.value = value;
  }

  void toggleSwitchTwo(bool value) {
    isSwitchTwoOn.value = value;
  }

  void toggleSwitchThree(bool value) {
    isSwitchThreeOn.value = value;
  }

  void toggleSwitchFour(bool value) {
    isSwitchFourOn.value = value;
  }

  void toggleSwitchFive(bool value) {
    isSwitchFiveOn.value = value;
  }

  void toggleSwitchSix(bool value) {
    isSwitchSixOn.value = value;
  }

  void toggleSwitchSeven(bool value) {
    isSwitchSevenOn.value = value;
  }

  //checked box data
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;
  var isChecked3 = false.obs;
}
