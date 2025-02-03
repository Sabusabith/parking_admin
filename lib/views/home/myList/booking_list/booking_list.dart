import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/myList/booking_list/slider_image/slider_image.dart';
import 'package:parking_app_admin/views/home/myList/booking_list/slider_image/testing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BookingList extends StatelessWidget {
  BookingList({super.key});

  final ValueNotifier<int> currentPage = ValueNotifier(0); // Track current page
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header with back and close icons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/backarrow.svg",
                        color: Colors.black,
                        height: 20,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/close.svg",
                        height: 30,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 35),

              // Image slider
              GestureDetector(onTap: () {
                Get.to(()=>BusSeatSelection());
              },
                child: SliderImage(
                  carouselController: carouselController,
                  onPageChanged: (index) => currentPage.value = index,
                ),
              ),
              const SizedBox(height: 20),

              // SmoothPageIndicator
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        child: SmoothPageIndicator(
                          controller: PageController(initialPage: value),
                          effect: WormEffect(
                            dotColor: Colors.grey.shade300,
                            activeDotColor: kprimerycolor,
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                          count: 4, // Number of images in the slider
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 25),

              // Details container
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: kgrey2tilecolor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Area Name",
                                  style: GoogleFonts.publicSans(
                                      color: Color(0xffA09B9B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("BTM",
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 75,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Area Name",
                                        style: GoogleFonts.publicSans(
                                            color: Color(0xffA09B9B),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "BTM-Layout-phase 1 Near visal mart",
                                      style: GoogleFonts.publicSans(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Area Location",
                                        style: GoogleFonts.publicSans(
                                            color: Color(0xffA09B9B),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "BTM-Layout-phase 1 ",
                                      style: GoogleFonts.publicSans(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 56,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Email id",
                                        style: GoogleFonts.publicSans(
                                            color: Color(0xffA09B9B),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Parkingapptest.com",
                                      style: GoogleFonts.publicSans(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Mobile",
                                        style: GoogleFonts.publicSans(
                                            color: Color(0xffA09B9B),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("+91 9539324400",
                                        style: GoogleFonts.publicSans(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Open Hours",
                                  style: GoogleFonts.publicSans(
                                      color: Color(0xffA09B9B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("9.30 AM",
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Slot Capacity",
                                  style: GoogleFonts.publicSans(
                                      color: Color(0xffA09B9B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("25",
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Parking Rate",
                                  style: GoogleFonts.publicSans(
                                      color: Color(0xffA09B9B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("50/h",
                                  style: GoogleFonts.publicSans(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
