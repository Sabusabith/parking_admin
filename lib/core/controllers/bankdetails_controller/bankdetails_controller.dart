import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BankDetailsController extends GetxController {
  // Observable list to hold dynamically added widgets
  var bankWidgets = <Widget>[].obs;

  // Observable variable to keep track of selected widget
  var selectedIndex = (1).obs;  // -1 indicates no selection

  // Initialize the list with an initial widget
  @override
  void onInit() {
    super.onInit();
 addBankWidget();
  }


  // Method to add a new widget
  void addBankWidget() {
    int newIndex = bankWidgets.length;
    bankWidgets.add(
      Obx(()=>
         BankWidget(
         
          isSelected: selectedIndex.value == newIndex, // Check if this widget is selected
          onTap: () {
            selectedIndex.value = newIndex;  
            // Set this widget as selected
            print(newIndex);
          },
        ),
      ),
    );
  }
}

class BankWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  BankWidget({
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap to select
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: isSelected
          //     ? Border.all(color: Colors.green, width: 2) // Green border when selected
          //     : null,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              minTileHeight: 40,
              leading: SvgPicture.asset(
                "assets/icons/bank.svg",
                height: 30,
              ),
              title: Text(
                "Axis Bank Account Active",
                style: GoogleFonts.publicSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              trailing: isSelected
                  ? SvgPicture.asset(
                      "assets/icons/tick2.svg",
                      height: 20,
                    ) // Show tick only when selected
                  : null,
            ),
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/bank.svg",
                height: 30,
              ),
              title: Text(
                "Account Details",
                style: GoogleFonts.publicSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/icons/share.svg",
                height: 20,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 62),
              child: Row(
                children: [
                  Text(
                    "A/C No.",
                    style: GoogleFonts.publicSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "**** **** **** 6191",
                    style: GoogleFonts.publicSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(width: 6),
                  SvgPicture.asset("assets/icons/Eye.svg", height: 17.39)
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 62),
              child: Row(
                children: [
                  Text(
                    "IFSC.",
                    style: GoogleFonts.publicSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "FEDL1000618",
                    style: GoogleFonts.publicSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 62),
              child: Row(
                children: [
                  Text(
                    "Type.",
                    style: GoogleFonts.publicSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(width: 30),
                  Text(
                    "Current",
                    style: GoogleFonts.publicSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
