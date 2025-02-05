import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/utils/widgets/custom_text_field.dart';
import 'package:parking_app_admin/views/home/myList/add_new_area/contact_details/contactdetails.dart';
import 'package:parking_app_admin/views/home/myList/add_new_slot/add_new_slot.dart';

class AddNewArea extends StatelessWidget {
  AddNewArea({super.key});
  final areanamecontroller = TextEditingController();
  final areaaddresscontroller = TextEditingController();
  final arealocationcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
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
                      Spacer(),
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
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/area.svg",
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add New Area",
                        style: GoogleFonts.publicSans(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                //area name.......
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Area Name",
                        style: GoogleFonts.publicSans(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.publicSans(
                            color: ksecndrycolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  left: 20,
                  right: 20,
                  contntpadding: 0,
                  maxlines: 1,
                  size: 45,
                  hint: "BTM",
                  controller: areanamecontroller,
                ),
                SizedBox(
                  height: 15,
                ),
                //area adress
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Area Address",
                        style: GoogleFonts.publicSans(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.publicSans(
                            color: ksecndrycolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  left: 20,
                  right: 20,
                  contntpadding: 25,
                  maxlines: 3,
                  size: 70,
                  hint: "BTM-Layout-phase 1 Near visal mart",
                  controller: areaaddresscontroller,
                ),
                //area location......................
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Area Location",
                        style: GoogleFonts.publicSans(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "*",
                        style: GoogleFonts.publicSans(
                            color: ksecndrycolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        left: 20,
                        right: 20,
                        contntpadding: 0,
                        maxlines: 1,
                        size: 45,
                        hint: "BTM-Layout-phase 1 ",
                        controller: arealocationcontroller,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              //alert dialogue for location............
                              Get.dialog(AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                contentPadding: EdgeInsets.all(0),
                                content: Stack(
                                  children: [
                                    Container(
                                      height: 375,
                                      width: 560,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          "assets/images/image 6.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: SvgPicture.asset(
                                          "assets/icons/close.svg",
                                          height: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                            },
                            child: Image.asset(
                              "assets/icons/Location.png",
                              color: ksecndrycolor,
                              height: 27,
                            )),
                        Text(
                          "Locate me",
                          style: GoogleFonts.publicSans(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    ),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Details",
                        style: GoogleFonts.publicSans(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),

                ///contact details...................
                Contactdetails()
              ],
            ),
          ),
          Positioned(
            bottom: 0, // Distance from the bottom of the screen
            left: 0, // Align to the left edge of the screen
            right: 0, // Align to the right edge of the screen
            child: Container(
              color: Colors.white, // Background color spanning the entire width
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 40, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the containers
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel', // Optional text inside the button
                          style: GoogleFonts.publicSans(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15, // Space between the buttons
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => AddNewSlot());
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: kprimerycolor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Save & Continue', // Optional text inside the button
                            style: GoogleFonts.publicSans(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
