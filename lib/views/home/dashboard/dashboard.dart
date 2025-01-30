import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/dashboard/all_bookings/allbookings.dart';
import 'package:parking_app_admin/views/home/dashboard/graphtile/graphtile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hi👋, Harikrishna",
                    style: GoogleFonts.caveat(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w700,
                        fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/loc.svg",
                    height: 20,
                  ),
                  Text(
                    " Bangalore-HSR Layout-11 ",
                    style: GoogleFonts.publicSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade900),
                  ),
                  SvgPicture.asset(
                    "assets/icons/downarrow.svg",
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Gross Revenue",
                    style: GoogleFonts.publicSans(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Graph tile
            Graphtile(),
             SizedBox(
              height: 18,
            ),


       //all bookings     
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "All Bookings",
                    style: GoogleFonts.publicSans(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                Spacer(),
                    Text(
                    "More",
                    style: GoogleFonts.publicSans(
                        color: Colors.grey.shade900,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                 
                SvgPicture.asset("assets/icons/arrowright.svg")

                ],
              ),
            ),
            SizedBox(height: 10,),
      AllBookings()
          ],
        ),
      ),
    );
  }


  
}
