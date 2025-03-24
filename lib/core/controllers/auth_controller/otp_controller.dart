import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/data/shared_pref/shared_pref.dart';
import 'package:parking_app_admin/core/models/auth/verify_otp_model.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/home.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../apiconfigs/apiconfigs.dart';

class OTPController extends GetxController with CodeAutoFill {
  OTPController(this.mobile, this.otp);
  final String mobile;
  var otp;
  RxBool isLoading = false.obs;
  var countdown = 15.obs;
  var canResend = false.obs;
  late Timer _timer;
  String? otpCode;
  VerifyOtpModel? otpModel;
  String? appSignature;

  @override
  void onInit() {
    super.onInit();
    listenForCode();
    listenOtp();
    startTimer();
    getAppSignature();
  }

  @override
  void codeUpdated() {
    otpCode = code;
    if (otpCode != null) {
      print('OTP Received: $otpCode');
      verifyOtp(otpCode!);
    }
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  void startTimer() {
    canResend.value = false;
    countdown.value = 300;
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
    startTimer();
    requestNewOTP();
  }

  void requestNewOTP() async {
    var url = AppUrls.BASE_URL + AppUrls.Generate_OTP;
    try {
      var response =
          await ApiProvider().post(url, {"mobileNumber": mobile.toString()});

      if (response.statusCode == 200) {
        Get.snackbar("OTP Sent", "A new OTP has been sent to $mobile",
            backgroundColor: Colors.green, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to send OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void verifyOtp(String code) async {
    isLoading(true);
    isLoading.value ? _onLoading() : null;
    try {
      var response = await await ApiProvider().post(
          AppUrls.BASE_URL + AppUrls.Verify_OTP,
          {'mobileNumber': mobile, 'otp': code});

      //Navigator.pop(Get.context!); 
      if (response.data['status'] == "success") {
        isLoading(false);
        otpModel = VerifyOtpModel.fromJson(response.data);
        // print("token ${otpModel?.data.token.toString()}");
        saveObject("token", otpModel?.data.token.toString());
        Get.snackbar("Success", "OTP Verified",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.to(() => Home());
      } else {
        Navigator.pop(Get.context!);
        Get.snackbar("Error", "Invalid OTP",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Navigator.pop(Get.context!);
      Get.snackbar("Error", "Invalid OTP",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void getAppSignature() async {
    try {
      String? signature = await SmsAutoFill().getAppSignature;
      if (signature.isNotEmpty) {
        print("App Signature: $signature");
      } else {
        print("App Signature is empty!");
      }
    } catch (e) {
      print("Error fetching App Signature: $e");
    }
  }

  @override
  void onClose() {
    cancel();
    _timer.cancel();
    super.onClose();
  }

  void _onLoading() {
    isLoading.value
        ? showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Dialog(
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 25),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: kprimerycolor,
                                strokeWidth: 2,
                              ),
                            )),
                        SizedBox(width: 15),
                        Text(
                          "Verifying OTP .....",
                          style: GoogleFonts.publicSans(
                              color: Colors.grey.shade900),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : null;
  }
}
