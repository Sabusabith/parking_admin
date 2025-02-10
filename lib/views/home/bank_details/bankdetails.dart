// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

import '../../../core/controllers/bankdetails_controller/bankdetails_controller.dart';

class Bankdetails extends StatelessWidget {
  const Bankdetails({super.key});

  @override
  Widget build(BuildContext context) {
    final BankDetailsController controller = Get.put(BankDetailsController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            // Header

            SizedBox(
              height: size.height < 700 ? size.height / 2.5 : size.height / 2.9,
              width: size.width,
              child: Stack(
                children: [
                  //background image...
                  Positioned.fill(
                    left: size.width > 700 ? -28 : -5,
                    right: size.width > 700 ? -28 : -5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      child: Image.asset(
                        "assets/images/Group 155.png",
                        width: size.width,
                        height: size.height < 700
                            ? size.height / 2.5
                            : size.height / 2.9,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height < 700
                        ? size.height / 2.5
                        : size.height / 2.9,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: size.width > 700
                            ? Radius.circular(52)
                            : Radius.circular(35),
                        bottomRight: size.width > 700
                            ? Radius.circular(52)
                            : Radius.circular(35),
                      ),
                      color: Colors.deepPurple.withOpacity(.4),
                    ),
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        children: [
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
                                    height: 20,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "Bank Details",
                                  style: GoogleFonts.publicSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  "assets/icons/close.svg",
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height > 860 ? 45 : 25),
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            
                            child: Image.asset("assets/images/axis2.png"),

                            
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Axis Bank - 6191",
                            style: GoogleFonts.publicSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Bal- ₹ 101256.50",
                            style: GoogleFonts.publicSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main content (list + button)
            Flexible(
              flex: 1,
              child: Obx(() => ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: [
                      Column(
                        children: [
                          // Render dynamic widgets
                          ...controller.bankWidgets,

                          // Add Button (always at the bottom of the list)
                          GestureDetector(
                            onTap: () {
                              controller.addBankWidget();
                            },
                            child: Container(
                              width: 160,
                              height: 30,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kprimerycolor,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Add Other Bank Account",
                                      style: GoogleFonts.publicSans(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
