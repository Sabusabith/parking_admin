import 'package:get/get.dart';

class HomeController extends GetxController {
  // bottomnavigationbar index
  var selectedIndex = 0.obs;

   void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
