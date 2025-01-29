import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:parking_app_admin/views/onboarding/onb1.dart';
import 'package:parking_app_admin/views/onboarding/onb2.dart';
import 'package:parking_app_admin/views/onboarding/onb3.dart';
import 'package:parking_app_admin/views/onboarding/onb4.dart';

import '../../core/controllers/onboarding_controller/onboarding_controller.dart';
import '../../utils/common/appcolors.dart';

class OnboardingPageView extends StatelessWidget {
  OnboardingPageView({super.key});

  final OnboardingController _controller = Get.put(OnboardingController());
  final PageController pageController = PageController();

  final List<Widget> _pages = [
    OnBoardingOne(),
    OnBoardingTwo(),
    OnBoardingThree(),
    OnBoardingFour(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbgcolor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
              height: 54, child: SvgPicture.asset("assets/images/logo1.svg")),
        ),
        leadingWidth: 100,
      ),
      backgroundColor: kbgcolor,
      body: Stack(
        children: [
          // PageView
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              _controller.updatePage(index);
            },
            children: _pages,
          ),
          // SmoothPageIndicator as an overlay
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: _pages.length,
                effect: ExpandingDotsEffect(
                  
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: kbluecolor,
                  dotColor: kprimerycolor,
                  expansionFactor: 6,
                  spacing: 6,
                ),
                onDotClicked: (index) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ),
//Button
          Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Center(
                child: Container(
                  width: 170,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kprimerycolor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child: Text(
                    "Next",
                    style: GoogleFonts.publicSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade900),
                  )),
                ),
              )),
          Positioned(
              right: 50,
              bottom: 55,
              child: Text(
                "Skip",
                style: GoogleFonts.publicSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800),
              ))
        ],
      ),
    );
  }
}
