import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/utils/dummy_datas/my_list_data.dart';
import 'package:parking_app_admin/views/home/myList/add_new_area/add_new_area.dart';
import 'package:parking_app_admin/views/home/myList/booking_list/booking_list.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: kprimerycolor,
            shape: CircleBorder(),
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.white,
            )),
            onPressed: () {
              _showNewAreaBottomsheet(
                context,
              );
            },
          ),
          Text(
            "Add New Area",
            style: GoogleFonts.publicSans(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade900),
          )
        ],
      ),
      backgroundColor: kbgcolor,
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Zone",
                  style: GoogleFonts.publicSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade900),
                ),
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
                        "BNGLR",
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
          // List view
          Expanded(
            child: ListView.builder(
              itemCount: mylistData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => BookingList());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: size.width,
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: ksecndrycolor)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 4, bottom: 4, top: 4),
                          child: Stack(children: [
                            Container(
                              height: 150,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kredtilecolor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Stack(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.deepPurple[300],
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Center(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              child: Image.asset(
                                                mylistData[index].img,
                                                fit: BoxFit.cover,
                                              ))),
                                      height: 130,
                                    ),
                                    Positioned(
                                        bottom: 8,
                                        right: 15,
                                        child: SvgPicture.asset(
                                          "assets/icons/photo.svg",
                                          height: 15,
                                        ))
                                  ])),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        // color: Colors.deepPurple[200],
                                        height: 130,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "BTM-Layout ",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                                SvgPicture.asset(
                                                  "assets/icons/location.svg",
                                                  height: 15,
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Near- Visal Mart",
                                                  style: GoogleFonts.publicSans(
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),

                                            ///slot details.....
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total Slots ",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Available Slots ",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade900),
                                                )
                                              ],
                                            ),

                                            //slot points details..
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "45 ",
                                                      style: GoogleFonts
                                                          .publicSans(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  ksecndrycolor),
                                                    ),
                                                    Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xff01509D)),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 45,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "12 ",
                                                      style: GoogleFonts
                                                          .publicSans(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  ksecndrycolor),
                                                    ),
                                                    Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: kgreencolor),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            //parking rate....
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Parking Rate: ",
                                                  style: GoogleFonts.publicSans(
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "4wheel 100rs/hr",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade900),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "2wheeler 60rs/hr",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade900),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Positioned(
                                right: 10,
                                top: 8,
                                child: SvgPicture.asset(
                                  "assets/icons/dot.svg",
                                  height: 27,
                                  width: 27,
                                ))
                          ]),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _showNewAreaBottomsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: kbgcolor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // Use Padding and SafeArea to ensure proper boundaries
        return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: AddNewArea(),
        );
      },
    );
  }
}
