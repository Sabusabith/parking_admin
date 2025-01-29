import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import '../../core/controllers/homecontroller/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kbgcolor,
      body: Obx(() => SizedBox(
            width: size.width,
            height: size.height,
            child: _screens[controller.selectedIndex.value],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: kprimerycolor,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }

  List _screens = [
    Container(color: Colors.white),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ];
}
