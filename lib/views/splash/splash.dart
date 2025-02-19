import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/splash_controller/splash_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbluecolor,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) => SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.asset(
                  "assets/images/splash.png",height: 140,
                  fit: BoxFit.contain
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Find and book parking slots effortlessly anytime, anywhere!",
                  style: GoogleFonts.publicSans(
                      fontWeight: FontWeight.w500,
                      color: kbgcolor,
                      fontStyle: FontStyle.italic,
                      fontSize: 15),textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
