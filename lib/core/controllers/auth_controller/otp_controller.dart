import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class OTPController extends GetxController {
  OTPController(this.otp);
  String otp;
  var countdown = 15.obs;
  var canResend = false.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    showOtp();
  }

//show otp while navigate to otp screen
  showOtp() {
    Get.snackbar("OTP", "",
        messageText: Text(
          otp,
          style: GoogleFonts.publicSans(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
        ),
        backgroundColor: const Color.fromARGB(255, 241, 238, 238),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.black);
  }

  void startTimer() {
    canResend.value = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        canResend.value = true;
        _timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  void restartTimer() {
    countdown.value = 15;
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
