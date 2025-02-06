import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart'; // Import the dropdown_button2 package
import 'package:parking_app_admin/core/controllers/add_new_slot_controller.dart/add_new_slot_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

import '../../../../utils/widgets/custom_text_field.dart';

class AddNewSlot extends StatelessWidget {
  AddNewSlot({super.key});
  AddNewSlotController controller = Get.put(AddNewSlotController(),permanent: true);
  final ratecontroller = TextEditingController();
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
          child: Stack(
            children: [ SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
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
                          "assets/icons/slot.svg",
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add New Slot",
                          style: GoogleFonts.publicSans(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
              
              
                    ///Added slots listttt......................................        
                Obx(()=>
                   controller.addedSlots.isNotEmpty?  Container(
                      width: size.width,
                      height: size.height / 3,
                      // color: Colors.green,
                      child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...controller.addedSlots,
                              SizedBox(height: 8,)
                            ],
                          ),
                        ),
                      
                    ):SizedBox(),
                ),
                 Obx(()=> controller.addedSlots.isNotEmpty? Transform(transform: Matrix4.translationValues(0, -7, 0),child: Divider(color: Colors.grey.shade300,thickness: 1.5,)):SizedBox()),
                  //..................................................................         
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Category",
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 45,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: ksecndrycolor, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Obx(
                          () => DropdownButton2<String>(
                            isExpanded: true,
                            value: controller.selectedCategory.value ==
                                    'Select an option'
                                ? null
                                : controller.selectedCategory.value,
                            underline: SizedBox(), // Remove underline
              
                            iconStyleData: IconStyleData(
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset("assets/icons/adown.svg",
                                    height: 19),
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(color: kbgcolor)),
                            hint: Text(
                              controller.selectedCategory.value ==
                                      'Select an option'
                                  ? "Select an option"
                                  : controller.selectedCategory.value,
                              style: GoogleFonts.publicSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            items: controller.options.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              controller.selectedCategory.value = newValue!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              "Slot No",
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
                              "Rate",
                              style: GoogleFonts.publicSans(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              "",
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
                        child: Obx(
                          () => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: SizedBox(
                              height: 45,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: ksecndrycolor, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  value: controller.slotNo.value == 'Slot No'
                                      ? null
                                      : controller.slotNo.value,
                                  underline: SizedBox(), // Remove underline
              
                                  iconStyleData: IconStyleData(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(
                                          "assets/icons/adown.svg",
                                          height: 19),
                                    ),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(color: kbgcolor)),
                                  hint: Text(
                                    controller.slotNo.value == 'Slot No'
                                        ? "Slot No"
                                        : controller.slotNo.value,
                                    style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  items: controller.slotoptions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    controller.slotNo.value = newValue!;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: CustomTextField(
                              left: 0,
                              right: 20,
                              hint: "50/h",
                              maxlines: 1,
                              controller: ratecontroller,
                              size: 45,
                              contntpadding: 0)),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
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
                              'Ev-Charging',
                              style: GoogleFonts.publicSans(
                                  color: Colors.grey.shade900,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.addNewSlot(
                              controller.selectedCategory.value,
                              controller.slotNo.value,
                              "20",
                              controller.isChecked1.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: SvgPicture.asset(
                            "assets/icons/add.svg",
                            height: 23,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addNewSlot(
                              controller.selectedCategory.value,
                              controller.slotNo.value,
                              ratecontroller.text,
                              controller.isChecked1.value);
                        },
                        child: Text(
                          "Add More",
                          style: GoogleFonts.publicSans(
                              color: ksecndrycolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      )
                    ],
                  )
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
            ]
          ),
        ),
      ),
    );
  }
}
