import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class BookingController extends GetxController {
  RxList<bool> isApprovedList = <bool>[].obs;

  // Initialize the approval list based on the number of bookings
  void initializeApprovalList(int itemCount) {
    isApprovedList.value = List<bool>.filled(itemCount, false);
  }

  // Approve or unapprove the specific index with confirmation dialog
  void toggleApproval(int index, String parkingSlot) {
    // Show confirmation dialog before changing approval status
    Get.defaultDialog(
      backgroundColor: kbgcolor,
      titlePadding: EdgeInsets.only(top: 15),
      title: "Confirm Approval",
      titleStyle: GoogleFonts.publicSans(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                "Are you sure you want to ${isApprovedList[index] ? 'unapprove' : 'approve'} this booking?"),
          ),
        ],
      ),
      confirm: GestureDetector(
        onTap: () {
          // Toggle the approval status if confirmed
          isApprovedList[index] = !isApprovedList[index];
          print(
              "Booking $index is ${isApprovedList[index] ? 'approved' : 'unapproved'}");
          Get.back();
          // Show Snackbar for successful approval
          _snackbar(parkingSlot, index);
        },
        child: Container(
          width: 73,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: kprimerycolor),
          child: Center(
              child: Text(
            "Yes",
            style: GoogleFonts.publicSans(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
          )),
        ),
      ),
      cancel: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 73,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black, width: 1)),
          child: Center(
              child: Text(
            "No",
            style: GoogleFonts.publicSans(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
          )),
        ),
      ),
    );
  }

  //Snackbar widget
  _snackbar(String parkingSlot, int index) {
    return Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 10),
      backgroundColor: Colors.grey.shade300,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      isDismissible: true,
      
      snackStyle: SnackStyle.FLOATING,
      titleText: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/tick2.svg",
              height: 29,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "$parkingSlot parking slot request is successfully ${isApprovedList[index] ? 'approved' : 'unapproved'}.",
                style: GoogleFonts.publicSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Transform(
              transform: Matrix4.translationValues(7, -24, 0),
              child: GestureDetector(
                onTap: () {
                  Get.closeCurrentSnackbar();
                },
                child: SvgPicture.asset(
                  "assets/icons/close.svg",
                  height: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
