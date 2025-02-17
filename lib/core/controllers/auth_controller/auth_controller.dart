import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:parking_app_admin/core/data/firebase/firebase_auth/firebase_auth.dart';
import 'package:parking_app_admin/views/auth/otp/otp.dart';

import '../../../views/home/home.dart';

class AuthController extends GetxController {
  var isTyping = false.obs;
  var verificationId = ''.obs;

  final AuthService _authService = AuthService();

  void signInWithPhoneNumber(String phoneNumber) {
    _authService.signInWithPhone(phoneNumber, (String verificationId) {
      this.verificationId.value = verificationId;
      Get.to(() => OTPScreen()); // Navigate to OTP screen after code is sent
    });
  }

  void verifyOTP(String otp) async {
    UserCredential? userCredential = await _authService.verifyOTP(verificationId.value, otp);
    if (userCredential != null) {
      Get.offAll(() => Home()); // Navigate to home screen on success
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }
  }
}
