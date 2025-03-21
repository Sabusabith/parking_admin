import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/get_profile_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/bookings/bookings.dart';
import 'package:parking_app_admin/views/home/dashboard/dashboard.dart';
import 'package:parking_app_admin/views/home/myList/my_list.dart';
import 'package:parking_app_admin/views/home/my_wallet/my_wallet.dart';
import 'package:parking_app_admin/views/home/profile/profile.dart';
import 'package:parking_app_admin/views/notification_screen/notification_screen.dart';
import '../../core/controllers/homecontroller/home_controller.dart';
import '../../core/controllers/refreshToken_controller/refresh_token_controller.dart';
import '../../utils/common/appcolors.dart';

class Home extends StatelessWidget {
  Home({super.key});
  RefreshTokenController rcontroller = Get.put(RefreshTokenController());

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final getprofileController = Get.put(GetProfileController());
    Size size = MediaQuery.of(context).size;
    print("screen width = ${size.width}");
    return Scaffold(
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(25),
        child: Obx(() {
          return AppBar(
            elevation: 0,
            toolbarHeight: 25,
            surfaceTintColor: Colors.transparent,
            backgroundColor: controller.selectedIndex.value == 3
                ? kprimerycolor
                : controller.selectedIndex.value == 4
                    ? kprimerycolor
                    : kbgcolor, // Reactive background color
            leadingWidth: 45,
            leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Builder(
                      builder: (context) => SizedBox(
                          width: 30,
                          height: 30,
                          child: SvgPicture.asset(
                            "assets/icons/menu.svg",
                            fit: BoxFit.contain,
                          )),
                    ))),
            actions: [
              GestureDetector(
                onTap: () {
                  // Get.to(NotificationScreen());
                 rcontroller.refreshToken();
                },
                child: SvgPicture.asset(
                  "assets/icons/bell.svg",
                  height: 30,
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          );
        }),
      ),
      backgroundColor: kbgcolor,
      body: Obx(() => Container(
            color: controller.selectedIndex.value == 3
                ? kprimerycolor
                : controller.selectedIndex.value == 4
                    ? kprimerycolor
                    : kbgcolor,
            width: size.width,
            height: size.height,
            child: _screens[controller.selectedIndex.value],
          )),
      bottomNavigationBar: Obx(() => Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: SizedBox(
              height: 95,
              width: size.width,
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
                selectedItemColor: Colors.grey.shade900,
                unselectedItemColor: Colors.grey.shade800,
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

  List _screens = [Dashboard(), MyList(), Bookings(), MyWallet(), Profile()];
}
