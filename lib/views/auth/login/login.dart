import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/auth_controller/auth_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/auth/otp/otp.dart';
import 'package:parking_app_admin/views/home/home.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final phoecontroller = TextEditingController();
  final authcontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kbgcolor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Section
                  Container(child: SvgPicture.asset("assets/images/logo1.svg")),
                  SizedBox(height: 35),

                  // Login Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Login With Mobile",
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

                  // Mobile Number Input Section
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        SizedBox(
                          width: 35,
                          height: 22,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.grey.shade700,
                            cursorHeight: 18,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "+91",
                              hintStyle: GoogleFonts.publicSans(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 22,
                          decoration:
                              BoxDecoration(color: Colors.grey.shade500),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Stack(
                            children: [
                              TextField(
                                controller: phoecontroller,
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.grey.shade700,
                                cursorHeight: 18,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile Number ",
                                  hintStyle: GoogleFonts.publicSans(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                onChanged: (value) {
                                  authcontroller.istyping.value = true;
                                  phoecontroller.value.text.isEmpty
                                      ? authcontroller.istyping.value = false
                                      : true;
                                },
                              ),
                              Obx(
                                () => authcontroller.istyping.value
                                    ? SizedBox()
                                    : Positioned(
                                        left: 105,
                                        top: 13,
                                        child: Text(
                                          "*",
                                          style: GoogleFonts.publicSans(
                                            color: ksecndrycolor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),

                  // Terms and Privacy
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "By continuing, i agree to the",
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
                                  text: " Terms of Service",
                                  style: GoogleFonts.publicSans(
                                    color: ksecndrycolor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: " & ",
                                  style: GoogleFonts.publicSans(
                                    color: Colors.grey.shade900,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() => Home());
                                    },
                                  text: "Privacy Policy",
                                  style: GoogleFonts.publicSans(
                                    color: ksecndrycolor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 27),

                  // Continue Button
                  GestureDetector(
                    onTap: () {
                      Get.to(() => OTPScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kprimerycolor,
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: GoogleFonts.publicSans(
                            color: Colors.grey.shade900,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),

                  // Help Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
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
