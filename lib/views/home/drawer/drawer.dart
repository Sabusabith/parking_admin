import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 4,
              decoration: BoxDecoration(
                  color: kprimerycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/images/prf.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Harikrishna",
                    style: GoogleFonts.caveat(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 28,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          "assets/icons/terms andconditions.zip",
                          height: 30,
                          width: 30,
                        ),
                        title: Text(
                          "Terms and Conditions",
                          style: GoogleFonts.caveat(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          "assets/icons/area.svg",
                          height: 30,
                          width: 30,
                        ),
                        title: Text(
                          "Privacy Policy",
                          style: GoogleFonts.caveat(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          "assets/icons/area.svg",
                          height: 30,
                          width: 30,
                        ),
                        title: Text(
                          "Refund Policy",
                          style: GoogleFonts.caveat(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          "assets/icons/area.svg",
                          height: 30,
                          width: 30,
                        ),
                        title: Text(
                          "Contact Support",
                          style: GoogleFonts.caveat(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          "assets/icons/area.svg",
                          height: 30,
                          width: 30,
                        ),
                        title: Text(
                          "Delete Account",
                          style: GoogleFonts.caveat(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  // leading: SvgPicture.asset(
                  //   "",
                  //   height: 30,
                  //   width: 30,
                  // ),
                  title: Text(
                    "Logout",
                    style: GoogleFonts.caveat(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}