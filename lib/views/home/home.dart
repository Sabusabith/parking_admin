import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/bookings/bookings.dart';
import 'package:parking_app_admin/views/home/dashboard/dashboard.dart';
import 'package:parking_app_admin/views/home/myList/my_list.dart';
import 'package:parking_app_admin/views/home/my_wallet/my_wallet.dart';
import 'package:parking_app_admin/views/home/profile/profile.dart';

import '../../core/controllers/homecontroller/home_controller.dart';
import 'profile/pop_profile_detail/pop_addprofile_detail.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.isProfilenull});
  bool isProfilenull;
  TextEditingController fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    // final getprofileController = Get.put(GetProfileController());
    Size size = MediaQuery.of(context).size;

    print("screen width = ${size.width}");

    // Show alert dialog if isProfilenull is true
    if (isProfilenull) {
      Future.microtask(() => _showProfileDialog(context));
    }
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
                onTap: () {},
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

// Function to show alert dialog
  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dialog from closing by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: kprimerycolor, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/prf.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 1,
                      bottom: 2,
                      child: Image.asset(
                        "assets/images/editcam.png",
                        height: 25,
                      ))
                ]),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Container(
                      width: 200,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          cursorHeight: 20,
                          style: GoogleFonts.caveat(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                          controller: fullNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your fullname",
                            hintStyle:
                                GoogleFonts.caveat(color: Colors.grey.shade400),
                          ),
                         
                        ),
                      )),
                ),
               
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                
    if (fullNameController.text.trim().isEmpty) {
      Get.snackbar(
        "Required",
        "Full name is required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      // Proceed with your action
      Navigator.pop(context);
      print("Full name: ${fullNameController.text}");
    }
  
                  },   
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffFFD900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Save  Changes', // Optional text inside the button
                          style: GoogleFonts.publicSans(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                 RichText(
                    text: TextSpan(
                        text: "*",
                        style: TextStyle(color: ksecndrycolor,fontSize: 18),
                        children: [
                      TextSpan(
                          text: " Full name is required",
                          style: GoogleFonts.publicSans(color: Colors.white,fontSize: 15))
                    ])),
              ],
            ),
          ),
        );
      },
    );
  }

  List _screens = [Dashboard(), MyList(), Bookings(), MyWallet(), Profile()];
}
