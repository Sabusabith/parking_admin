import 'dart:async'; // For Timer
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../core/controllers/auth_controller/otp_controller.dart';
import '../../home/home.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key, this.mobilenum, this.otp});

  String? mobilenum;
  String? otp;
  @override
  Widget build(BuildContext context) {
    // Using the OTPController with GetX

    final otpController = Get.put(OTPController(mobilenum.toString(), otp));

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Section
                  Container(
                      child: Image.asset(
                    "assets/images/logo1.png",
                    height: 55,
                  )),
                  SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Verify with OTP",
                          style: GoogleFonts.publicSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(right: 120, left: 10),
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 12),
                      width: size.width,
                      child: PinFieldAutoFill(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: BoxLooseDecoration(
                          textStyle: GoogleFonts.publicSans(
                              color: Colors.grey.shade800,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          strokeColorBuilder: FixedColorBuilder(
                              Colors.grey.shade700), // Border color
                          bgColorBuilder: FixedColorBuilder(
                              Colors.white), // Background color
                          gapSpace: 21, // Space between boxes
                          radius: Radius.circular(
                              10), // Set to zero for perfect rectangle
                          strokeWidth: 1.5, // Border thickness
                        ),
                        codeLength: 4,
                        onCodeChanged: (code) {
                          print("changed code $code");
                          if (code.toString().isNotEmpty &&
                              code.toString().length == 4) {
                            otpController.verifyOtp(code.toString() ?? "4444");
                          }
                        },
                        onCodeSubmitted: (code) {
                          print("submited code $code");

                          otpController.verifyOtp(code);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  // Resend OTP section with GetX reactive update
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() {
                          return otpController.canResend.value
                              ? GestureDetector(
                                  onTap: () {
                                    otpController
                                        .restartTimer(); // Restart timer on click
                                  },
                                  child: Text(
                                    "Resend OTP",
                                    style: GoogleFonts.publicSans(
                                      color: ksecndrycolor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    text: "Resend OTP in ",
                                    style: GoogleFonts.publicSans(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: otpController.countdown.value == 0
                                            ? "00:00"
                                            : "${(otpController.countdown.value ~/ 60).toString().padLeft(2, '0')}:${(otpController.countdown.value % 60).toString().padLeft(2, '0')}",
                                        style: GoogleFonts.publicSans(
                                          color:
                                              otpController.countdown.value == 0
                                                  ? Colors.red
                                                  : Colors.grey.shade600,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Having trouble? ",
                            style: GoogleFonts.publicSans(
                              color: Colors.grey.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                  
                                  },
                                text: "Need help",
                                style: GoogleFonts.publicSans(
                                  color: ksecndrycolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
