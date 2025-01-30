import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/views/home/dashboard/all_bookings/allbookings.dart';

import '../../../utils/common/appcolors.dart';
import '../../../utils/dummy_datas/my_list_data.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: kbgcolor,
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "All Bookings",
                  style: GoogleFonts.publicSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade900),
                ),
                Spacer(),
//sort..
 Container(
                  width: 73,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      SvgPicture.asset(
                        "assets/icons/connection.svg",
                        height: 8.12,
                        width: 7,
                      ),
                      Spacer(),
                      Text(
                        "Sort",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey.shade900),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        "assets/icons/downarrow.svg",
                        height: 14,
                        width: 12,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                ),

SizedBox(width: 10,),



                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      SvgPicture.asset(
                        "assets/icons/filter.svg",
                        height: 12,
                        width: 12,
                      ),
                      Spacer(),
                      Text(
                        "Filter",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                            color: Colors.grey.shade900),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        "assets/icons/downarrow.svg",
                        height: 14,
                        width: 12,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ksecndrycolor)),
            child: TextField(
              cursorHeight: 20,
              style: GoogleFonts.publicSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800),
              cursorColor: Colors.grey.shade800,
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.publicSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff9395A4)),
                  contentPadding: const EdgeInsets.only(
                      left: 30, bottom: 6), // Adjust padding here
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, right: 10), // Padding for prefixIcon
                    child: SvgPicture.asset(
                      "assets/icons/search.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 24,
                    maxWidth: 100, // Constrain size
                  ),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        //All bookings list ......
        AllBookings()
        ],
      ),
    );
  }
}
