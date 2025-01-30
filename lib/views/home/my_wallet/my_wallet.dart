import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/my_wallet/bottom_screen.dart';
import 'package:parking_app_admin/views/home/my_wallet/payout_button.dart';
import 'package:parking_app_admin/views/home/my_wallet/wallet_data_card.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kprimerycolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 18,
                  child: Text(
                    "My Wallet",
                    style: GoogleFonts.publicSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade900),
                  ),
                ),
                Positioned(
                  right: 1,
                  top: 1,
                  child: Transform(
                    transform: Matrix4.translationValues(0, -15, 0),
                    child: RotationTransition(
                        turns: new AlwaysStoppedAnimation(1 / 360),
                        child: Image.asset(
                          "assets/images/cube.png",
                          fit: BoxFit.cover,
                          height: 157.98,
                          width: 157.98,
                        )),
                  ),
                ),

                //Details container
                WalletDataCard(),
                //payoutbutton...
                PayoutButton()
              ],
            )),

            // Fixed Bottom Sheet
          BottomScreen()
          ],
        ),
      ),
    );
  }
}
