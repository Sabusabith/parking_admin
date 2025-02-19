import 'dart:async'; // For Timer
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/controllers/auth_controller/otp_controller.dart';
import '../../home/home.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using the OTPController with GetX
    final otpController = Get.put(OTPController());

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
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    width: size.width,
                    child: OtpTextField(
                      showCursor: false,
                      alignment: Alignment.centerLeft,
                      fieldHeight: 40,
                      fieldWidth: 40,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      borderRadius: BorderRadius.circular(10),
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      numberOfFields: 4,
                      borderColor: Colors.grey.shade700,
                      enabledBorderColor: Colors.grey.shade700,
                      focusedBorderColor: Colors.grey.shade900,
                      cursorColor: Colors.grey.shade700,
                      borderWidth: 1,
                      keyboardType: TextInputType.number,
                      showFieldAsBox: true,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Verification Code"),
                                content:
                                    Text('Code entered is $verificationCode'),
                                actions: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => Home());
                                    },
                                    child: Container(
                                      height: 45,
                                      width: size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: kprimerycolor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Next",
                                          style: GoogleFonts.publicSans(
                                              color: Colors.grey.shade900,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      },
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
                                            : "00:${otpController.countdown.value.toString().padLeft(2, '0')}",
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
                                    Get.to(() => Home());
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
