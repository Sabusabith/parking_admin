import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/my_wallet/bottom_screen/bottom_screen.dart';
import 'package:parking_app_admin/views/home/my_wallet/payout_button.dart';
import 'package:parking_app_admin/views/home/my_wallet/wallet_data_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;

    print("Screen width: $screenWidth");
    print("Screen height: $screenHeight");

    return Container(
      width: size.width,
      height: size.height,
      color: kprimerycolor,
      child: Column(
        children: [
          // Top Section
          Stack(children: [
            Positioned(
                left: 20,
                right: -20,
                top: 10,
                child: Image.asset(
                  "assets/images/walletbg.png",
                  fit: BoxFit.cover,
                )),
            Align(alignment: Alignment.topCenter,
              child: SizedBox(
                width: screenWidth,
                height: 380,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.07, // Dynamic height
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: WalletDataCard(),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: PayoutButton(),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    
          // Bottom Section (Responsive Size)
          Flexible(
            flex: 1, // This takes up the rest of the space dynamically
            child: SizedBox(
              height: max(screenHeight * 0.8, 240), // Ensure minimum height
              child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    // Detect swipe up
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // To allow full screen height adjustment
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          BottomScreen(), // Display BottomScreen as Modal
                    );
                  },
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // To allow full screen height adjustment
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          BottomScreen(), // Display BottomScreen as Modal
                    );
                  },
                  child: const BottomScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
