import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class AddNewSlotController extends GetxController {
  // The selected category to be displayed
  var selectedCategory = 'Select an option'.obs;

  // List of options for the dropdown
  final List<String> options = [
    '4 Wheeler',
    '2 Wheeler',
    '6 Wheeler',
    '3 Wheeler'
  ];

  // The selected slot number to be displayed
  var slotNo = 'Slot No'.obs;

  // List of slot options for the dropdown
  final List<String> slotoptions = ['P-01', 'P-02', 'P-03', 'P-04'];

  // Checkbox for EV charging
  var isChecked1 = false.obs;

  // List to hold the added slots
  var addedSlots = <Widget>[].obs;

  // Method to add a new slot
  void addNewSlot(String category, String slotNumber, String rate, bool isEV) {
    addedSlots.add(SlotModel(
      category: category,
      slotNumber: slotNumber,
      rate: rate,
      isEV: isEV,
    ));
  }
}

// SlotModel to represent each slot
class SlotModel extends StatelessWidget {
  final String category;
  final String slotNumber;
  final String rate;
  final bool isEV;

  SlotModel({
    required this.category,
    required this.slotNumber,
    required this.rate,
    required this.isEV,
  });
  Size size = MediaQuery.of(Get.context!).size;
  @override
  Widget build(Object context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: ksecndrycolor)),
        height: 102,
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          child: Container(
            width: size.width,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffFFE7E7)),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

              children: [
                
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Category: ",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "  ${category}",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      "assets/icons/dotvertical.svg",
                      height: 27,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Slot No  ",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${slotNumber}",
                      style: GoogleFonts.publicSans(
                          color: Color(0xffA09B9B),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Text(
                      "Rate  ",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${rate}/h",
                      style: GoogleFonts.publicSans(
                          color: Color(0xffA09B9B),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                    Container(
                        height: 18,
                        width: 16.88,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ksecndrycolor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: isEV
                            ? Center(
                                child: SvgPicture.asset(
                                  "assets/icons/check.svg",
                                  height: 7.75,
                                ),
                              )
                            : null,
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
                )
              ],
            ),
          ),
        ));
  }
}
