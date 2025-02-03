import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/add_new_area_controller.dart/add_new_area_controller.dart';
import 'package:parking_app_admin/views/home/myList/add_new_area/contact_details/widget/timefiled.dart';

import '../../../../../utils/common/appcolors.dart';
import '../../../../../utils/widgets/custom_text_field.dart';

class Contactdetails extends StatelessWidget {
  Contactdetails({super.key});
  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final slotcapacitycontroller = TextEditingController();
  final parkingratecontroller = TextEditingController();

  AddNewAreaController controller = Get.put(AddNewAreaController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email id",
                style: GoogleFonts.publicSans(
                    color: Colors.black,
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
          hint: "Parkingapptest.com",
          controller: emailcontroller,
        ),

        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Mobile",
                style: GoogleFonts.publicSans(
                    color: Colors.black,
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
          hint: "+91 9539324400",
          controller: mobilecontroller,
        ),

        ///working hours.......
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Working Hours",
                style: GoogleFonts.publicSans(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 20,
        ),
        Container(
          height: 326,
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Color(0xffFFF5F5),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),

              //Sunday.................................................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                      child: Text(
                        "Sun",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 35,
                        child: FittedBox(
                            child: Switch(
                                trackOutlineColor:
                                    WidgetStatePropertyAll(kprimerycolor),
                                value: controller.isSwitchOneOn.value,
                                onChanged: controller.toggleSwitchOne,
                                activeColor:
                                    Colors.white, // Active thumb color (White)
                                inactiveThumbColor:
                                    kprimerycolor, // Inactive thumb color (Yellow)
                                activeTrackColor:
                                    kprimerycolor, // Active track color (White)
                                inactiveTrackColor: Colors
                                    .white // Inactive track color (Yellow)
                                )),
                      ),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 AM"),
                    Spacer(),
                    Text(
                      "To",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 PM"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Monday.................................................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                      child: Text(
                        "Mon",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 35,
                        child: FittedBox(
                            child: Switch(
                                trackOutlineColor:
                                    WidgetStatePropertyAll(kprimerycolor),
                                value: controller.isSwitchTwoOn.value,
                                onChanged: controller.toggleSwitchTwo,
                                activeColor:
                                    Colors.white, // Active thumb color (White)
                                inactiveThumbColor:
                                    kprimerycolor, // Inactive thumb color (Yellow)
                                activeTrackColor:
                                    kprimerycolor, // Active track color (White)
                                inactiveTrackColor: Colors
                                    .white // Inactive track color (Yellow)
                                )),
                      ),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 AM"),
                    Spacer(),
                    Text(
                      "To",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 PM"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Tusday.................................................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                      child: Text(
                        "Tue",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 35,
                        child: FittedBox(
                            child: Switch(
                                trackOutlineColor:
                                    WidgetStatePropertyAll(kprimerycolor),
                                value: controller.isSwitchThreeOn.value,
                                onChanged: controller.toggleSwitchThree,
                                activeColor:
                                    Colors.white, // Active thumb color (White)
                                inactiveThumbColor:
                                    kprimerycolor, // Inactive thumb color (Yellow)
                                activeTrackColor:
                                    kprimerycolor, // Active track color (White)
                                inactiveTrackColor: Colors
                                    .white // Inactive track color (Yellow)
                                )),
                      ),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 AM"),
                    Spacer(),
                    Text(
                      "To",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 PM"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Wednesday.................................................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                      child: Text(
                        "Wed",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 35,
                        child: FittedBox(
                            child: Switch(
                                trackOutlineColor:
                                    WidgetStatePropertyAll(kprimerycolor),
                                value: controller.isSwitchFourOn.value,
                                onChanged: controller.toggleSwitchFour,
                                activeColor:
                                    Colors.white, // Active thumb color (White)
                                inactiveThumbColor:
                                    kprimerycolor, // Inactive thumb color (Yellow)
                                activeTrackColor:
                                    kprimerycolor, // Active track color (White)
                                inactiveTrackColor: Colors
                                    .white // Inactive track color (Yellow)
                                )),
                      ),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 AM"),
                    Spacer(),
                    Text(
                      "To",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 PM"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Thursday.................................................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                      child: Text(
                        "Thu",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 35,
                        child: FittedBox(
                            child: Switch(
                                trackOutlineColor:
                                    WidgetStatePropertyAll(kprimerycolor),
                                value: controller.isSwitchFiveOn.value,
                                onChanged: controller.toggleSwitchFive,
                                activeColor:
                                    Colors.white, // Active thumb color (White)
                                inactiveThumbColor:
                                    kprimerycolor, // Inactive thumb color (Yellow)
                                activeTrackColor:
                                    kprimerycolor, // Active track color (White)
                                inactiveTrackColor: Colors
                                    .white // Inactive track color (Yellow)
                                )),
                      ),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 AM"),
                    Spacer(),
                    Text(
                      "To",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 PM"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //friday.................................................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                      child: Text(
                        "Fri",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 35,
                        child: FittedBox(
                            child: Switch(
                                trackOutlineColor:
                                    WidgetStatePropertyAll(kprimerycolor),
                                value: controller.isSwitchSixOn.value,
                                onChanged: controller.toggleSwitchSix,
                                activeColor:
                                    Colors.white, // Active thumb color (White)
                                inactiveThumbColor:
                                    kprimerycolor, // Inactive thumb color (Yellow)
                                activeTrackColor:
                                    kprimerycolor, // Active track color (White)
                                inactiveTrackColor: Colors
                                    .white // Inactive track color (Yellow)
                                )),
                      ),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 AM"),
                    Spacer(),
                    Text(
                      "To",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 PM"),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //saturday.................................................................
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                      child: Text(
                        "Sat",
                        style: GoogleFonts.publicSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Obx(
                      () => SizedBox(
                        height: 35,
                        child: FittedBox(
                            child: Switch(
                                trackOutlineColor:
                                    WidgetStatePropertyAll(kprimerycolor),
                                value: controller.isSwitchSevenOn.value,
                                onChanged: controller.toggleSwitchSeven,
                                activeColor:
                                    Colors.white, // Active thumb color (White)
                                inactiveThumbColor:
                                    kprimerycolor, // Inactive thumb color (Yellow)
                                activeTrackColor:
                                    kprimerycolor, // Active track color (White)
                                inactiveTrackColor: Colors
                                    .white // Inactive track color (Yellow)
                                )),
                      ),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 AM"),
                    Spacer(),
                    Text(
                      "To",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Spacer(),
                    Timefiled(hint: "9.30 PM"),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    "Slot Capacity",
                    style: GoogleFonts.publicSans(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "Parking Rate",
                    style: GoogleFonts.publicSans(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: CustomTextField(
                    right: 0,
                    left: 20,
                    hint: "25",
                    maxlines: 1,
                    controller: slotcapacitycontroller,
                    size: 45,
                    contntpadding: 0)),
            SizedBox(
              width: 15,
            ),
            Expanded(
                child: CustomTextField(
                    left: 0,
                    right: 20,
                    hint: "50/h",
                    maxlines: 1,
                    controller: parkingratecontroller,
                    size: 45,
                    contntpadding: 0)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "Value-Added Benefits",
                style: GoogleFonts.publicSans(
                    color: Colors.grey.shade900, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isChecked1.value =
                            !controller.isChecked1.value;
                      },
                      child: Container(
                        height: 18,
                        width: 16.88,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ksecndrycolor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: controller.isChecked1.value
                            ? Center(
                                child: SvgPicture.asset(
                                  "assets/icons/check.svg",
                                  height: 7.75,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'CCTV',
                    style: GoogleFonts.publicSans(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Row(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isChecked2.value =
                            !controller.isChecked2.value;
                      },
                      child: Container(
                        height: 18,
                        width: 16.88,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ksecndrycolor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: controller.isChecked2.value
                            ? Center(
                                child: SvgPicture.asset(
                                  "assets/icons/check.svg",
                                  height: 7.75,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Ev-Charging',
                    style: GoogleFonts.publicSans(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Row(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isChecked3.value =
                            !controller.isChecked3.value;
                      },
                      child: Container(
                        height: 18,
                        width: 16.88,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ksecndrycolor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: controller.isChecked3.value
                            ? Center(
                                child: SvgPicture.asset(
                                  "assets/icons/check.svg",
                                  height: 7.75,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Covered Parking',
                    style: GoogleFonts.publicSans(
                        color: Colors.grey.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        SizedBox(
          height: size.height/7,
        ),
      ],
    );
  }
}
