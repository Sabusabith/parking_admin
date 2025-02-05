// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/homecontroller/home_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 21, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // navigate to myList screen
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            "assets/icons/backarrow.svg",
                            color: Colors.black,
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 29,
                        ),
                        const Text(
                          "Notification",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // navigate to home
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            "assets/icons/close.svg",
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 16,
                      child: Text(
                        "Today",
                        style: GoogleFonts.publicSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: kblackcolor,
                         
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 12,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        height: 44,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: kpeachtilecolor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                            left: 12,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Add New slot in BTM-Layout",
                                style: GoogleFonts.publicSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    
                                    color: kblackcolor),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    // function to be written
                                  },
                                  icon: Icon(
                                    Icons.more_horiz,
                                    size: 27,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      child: Text(
                        "Yesterday",
                        style: GoogleFonts.publicSans(
                            color: kblackcolor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                              height: 44,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: kpeachtilecolor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                  left: 12,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Add New slot in BTM-Layout",
                                      style: GoogleFonts.publicSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          
                                          color: kblackcolor),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          // function to be written
                                        },
                                        icon: Icon(
                                          Icons.more_horiz,
                                          size: 27,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 12,
                            ),
                        itemCount: 6)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
