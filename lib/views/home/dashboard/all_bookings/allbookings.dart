import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/booking_controller/booking_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/utils/dummy_datas/all_booking_data.dart';

class AllBookings extends StatelessWidget {
  AllBookings({super.key});
  BookingController controller = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.initializeApprovalList(bookingdatas.length);

    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: bookingdatas.length,
        itemBuilder: (context, index) {
            String parkingSlot = "P-${index + 1}";
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  height: 140,
                  decoration: BoxDecoration(
                      color: kgreytilecolor,
                      borderRadius: BorderRadius.circular(24)),
                  child: Stack(children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 120,
                              height: 90,
                              // color: Colors.green.withOpacity(.5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      bookingdatas[index].week,
                                      style: GoogleFonts.publicSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: ksecndrycolor),
                                    ),
                                    Transform(
                                      transform:
                                          Matrix4.translationValues(-1, -4, 0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 42,
                                            // color: Colors.green.withOpacity(.5),
                                            child: Text(
                                              bookingdatas[index].date,
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w600,
                                                  color: ksecndrycolor),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          //car image
                                          Column(
                                            children: [
                                              Image.asset(
                                                bookingdatas[index].image,
                                                height: 29,
                                              ),
                                              SizedBox(
                                                width: 50,
                                                child: Text(
                                                  bookingdatas[index]
                                                      .vehiclename,
                                                  style: GoogleFonts.publicSans(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 3,
                              height: 63,
                              color: Color(0xffC6DFF8),
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  height: 90,
                                  // color: ksecndrycolor,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/Clock.svg"),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              bookingdatas[index].time,
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade900),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/charge.svg"),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              bookingdatas[index].charging,
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade900),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/icons/flag.svg"),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              bookingdatas[index].slot,
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade900),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Transform(
                            transform: Matrix4.translationValues(0, -7, 0),
                            child: Divider(
                              thickness: 1,
                              color: ksecndrycolor,
                            ),
                          ),
                        ),

                        //Buttons
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Transform(
                            transform: Matrix4.translationValues(0, -5, 0),
                            child: Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  controller.isApprovedList[index]
                                      ? SizedBox()
                                      : Container(
                                          width: 67,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Center(
                                            child: Text(
                                              "Cancel",
                                              style: GoogleFonts.publicSans(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade900),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                   controller.toggleApproval(index,  bookingdatas[index].slot);
                                    },
                                    child: controller.isApprovedList[index]
                                        ? Container(
                                            width: 90,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      "assets/icons/tick.svg"),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Approved",
                                                    style:
                                                        GoogleFonts.publicSans(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff01509D)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 67,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: kprimerycolor),
                                            child: Center(
                                              child: Text(
                                                "Approve",
                                                style: GoogleFonts.publicSans(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        Colors.grey.shade900),
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 10,
                      top: 7,
                      child: Container(
                        width: 33,
                        height: 14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33),
                            color: kgreencolor),
                        child: Center(
                            child: Text(
                          "Booked",
                          style: GoogleFonts.publicSans(
                              fontSize: 6,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                      ),
                    )
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
