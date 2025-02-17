import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/common/appcolors.dart';
import '../../../../../utils/dummy_datas/all_booking_data.dart';

class AllTransactionTab extends StatelessWidget {
  const AllTransactionTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: bookingdatas.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Stack(children: [
                      Container(
                        // color: Colors.red,
                        height: 100,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Container(
                    
                              width: size.width,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: kgreytilecolor,
                                  borderRadius: BorderRadius.circular(24)),
                              child: Stack(children: [
                                Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 90,
                                        // color: Colors.green.withOpacity(.5),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //car image
                                                  Column(
                                                    children: [
                                                      Image.asset(
                                                        bookingdatas[index].image,
                                                        height: 29,
                                                      ),
                                                      SizedBox(
                                                        width: 80,
                                                        child: Text(
                                                          bookingdatas[index]
                                                              .vehiclename,
                                                          style: GoogleFonts
                                                              .publicSans(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors
                                                                .grey.shade900,
                                                          ),
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
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
                                                        style:
                                                            GoogleFonts.publicSans(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                color: Colors
                                                                    .grey.shade900),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
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
                                                        bookingdatas[index]
                                                            .charging,
                                                        style:
                                                            GoogleFonts.publicSans(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                color: Colors
                                                                    .grey.shade900),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
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
                                                        style:
                                                            GoogleFonts.publicSans(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                color: Colors
                                                                    .grey.shade900),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Paid",
                                            style: GoogleFonts.publicSans(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            "₹1999",
                                            style: GoogleFonts.publicSans(
                                                color: kgreencolor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.italic),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  ),
                                ]),
                              ])),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: SvgPicture.asset(
                            "assets/icons/tick2.svg",
                            height: 22,
                          ))
                    ])
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
