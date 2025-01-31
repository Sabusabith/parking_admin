import 'package:flutter/material.dart';
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
                height: 15,
              ),

        //Sunday.................................................................      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(width: 26,
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
SizedBox(height: 10,),
 //Monday.................................................................   
Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(width: 26,
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
              )      ,
              SizedBox(height: 10,),
 //Tusday.................................................................   
Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(width: 26,
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
              )       ,
                SizedBox(height: 10,),
 //Wednesday.................................................................   
Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(width: 26,
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
              )              
            ],
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
