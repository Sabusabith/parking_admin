import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

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
              child: Container(
                  child: Image.asset(
                "assets/images/on2.png",
             
            
              )),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "\"Your Car, Our Priority.\"",
              style: GoogleFonts.publicSans(
                  color: kbluecolor, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ensuring safety, one spot at a time.Discover secure parking solutions and experience peace of mind.",
                style: GoogleFonts.publicSans(
                    color: Colors.grey.shade900,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}
