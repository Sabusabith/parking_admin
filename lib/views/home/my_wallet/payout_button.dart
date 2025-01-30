import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/my_wallet_controller/my_wallet_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class PayoutButton extends StatelessWidget {
  const PayoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    MyWalletController controller = Get.put(MyWalletController());
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 15,
      left: 20,
      right: 20,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Weekly Paid Out",
                style: GoogleFonts.publicSans(
                    color: Colors.grey.shade900,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                "assets/icons/about.svg",
                height: 15,
              ),
              // The Switch Widget
              Spacer(),
              Obx(
                () => SizedBox(height: 35,
                  child: FittedBox(
                    child: Switch(
                      
                        trackOutlineColor: WidgetStatePropertyAll(kprimerycolor),
                        trackOutlineWidth: WidgetStatePropertyAll(1),
                        value: controller.isSwitchOn.value,
                        onChanged: controller.toggleSwitch,
                        activeColor: kprimerycolor,
                    
                        // activeTrackColor: kprimerycolor,
                        trackColor: WidgetStatePropertyAll(Colors.white),
                        thumbColor: WidgetStatePropertyAll(kprimerycolor),
                        inactiveThumbColor: kprimerycolor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
