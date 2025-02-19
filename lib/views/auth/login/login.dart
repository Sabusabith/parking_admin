import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/auth_controller/auth_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final phoneController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kbgcolor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                Image.asset("assets/images/logo1.png",height: 55,),
                SizedBox(height: 35),

                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login With Mobile",
                      style: GoogleFonts.publicSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Phone Input
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade800),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Text("+91", style: TextStyle(fontSize: 14)),
                       SizedBox(width: 5),
                      Container(width: 1, height: 22, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Mobile Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22),

                // Terms & Privacy
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "By continuing, I agree to the ",
                      style: GoogleFonts.publicSans(fontSize: 12, color: Colors.grey.shade900),
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: TextStyle(color: ksecndrycolor),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(text: " & "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: ksecndrycolor),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 27),

                // Continue Button
                GestureDetector(
                  onTap: () {
                    String phoneNumber = "+91${phoneController.text.trim()}";
                    if (phoneController.text.length < 10) {
                      Get.snackbar("Error", "Enter a valid phone number");
                    } else {
                      authController.signInWithPhoneNumber(phoneNumber);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kprimerycolor,
                    ),
                    child: Center(child: Text("Continue")),
                  ),
                ),
                SizedBox(height: 22),

                // Help Section
                Text.rich(
                  TextSpan(
                    text: "Having trouble? ",
                    children: [
                      TextSpan(
                        text: "Need help",
                        style: TextStyle(color: ksecndrycolor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
