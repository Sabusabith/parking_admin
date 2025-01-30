import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/dashboard/dashboard.dart';
import '../../core/controllers/homecontroller/home_controller.dart';
import '../../utils/common/appcolors.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(toolbarHeight: 30,surfaceTintColor: Colors.transparent,
        backgroundColor: kbgcolor,
        leadingWidth: 45,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/menu.svg",
                fit: BoxFit.contain,
              )),
        ),
        actions: [
          SvgPicture.asset("assets/icons/bell.svg",height: 30,),
          SizedBox(width: 20,)
        ],
      ),
      backgroundColor: kbgcolor,
      body: Obx(() => SizedBox(
            width: size.width,
            height: size.height,
            child: _screens[controller.selectedIndex.value],
          )),
      bottomNavigationBar: Obx(() => Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: SizedBox(height: 95,width: size.width,
          child: BottomNavigationBar(
            
                backgroundColor: kbgcolor,
                elevation: 0,
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                unselectedFontSize: 12,
                unselectedLabelStyle: GoogleFonts.publicSans(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
                selectedLabelStyle: GoogleFonts.publicSans(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
                selectedItemColor: Colors.grey.shade900, // Set selected color
                unselectedItemColor: Colors.grey.shade800, // Set unselected color
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: SvgPicture.asset(
                          "assets/icons/dashboard.svg",
                          color: controller.selectedIndex.value == 0
                              ? kprimerycolor
                              : Colors.grey.shade800,
                        ),
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 7.0),
                        child: SvgPicture.asset(
                          "assets/icons/list.svg",
                          color: controller.selectedIndex.value == 1
                              ? kprimerycolor
                              : Colors.grey.shade800,
                        ),
                      ),
                      label: 'My List'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: SvgPicture.asset(
                          "assets/icons/bookigs.svg",
                          color: controller.selectedIndex.value == 2
                              ? kprimerycolor
                              : Colors.grey.shade800,
                        ),
                      ),
                      label: 'Bookings'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: SvgPicture.asset(
                          "assets/icons/Wallet.svg",
                          color: controller.selectedIndex.value == 3
                              ? kprimerycolor
                              : Colors.grey.shade800,
                        ),
                      ),
                      label: 'Wallet'),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: SvgPicture.asset(
                          "assets/icons/User.svg",
                          color: controller.selectedIndex.value == 4
                              ? kprimerycolor
                              : Colors.grey.shade800,
                        ),
                      ),
                      label: 'Profile'),
                ],
              ),
        ),
      )),
    );
  }

  List _screens = [
    Dashboard(),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
    Container(color: Colors.yellow),
  ];
}
