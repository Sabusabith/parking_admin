import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
     
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(child: SvgPicture.asset("assets/images/on1.svg",)),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "\"Find Parking in a Snap!\"",
              style: GoogleFonts.publicSans(
                  color: kbluecolor, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "No more endless circling. Discover nearby parking spots instantly.Get ready to park with ease.",
                style: GoogleFonts.publicSans(
                    color: Colors.grey.shade900,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
