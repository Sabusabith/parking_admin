import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/my_wallet/bottom_screen/all_transaction_tab/all_transaction_tab.dart';

class BottomScreen extends StatelessWidget {
  const BottomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height / 2.4, // Height for the bottom sheet
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          // Header Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/retry.svg",
                  height: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  "Transaction History",
                  style: GoogleFonts.publicSans(
                    color: Colors.grey.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 7),
                      SvgPicture.asset(
                        "assets/icons/filter.svg",
                        height: 12,
                        width: 12,
                      ),
                      const Spacer(),
                      Text(
                        "Jan",
                        style: GoogleFonts.publicSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        "assets/icons/downarrow.svg",
                        height: 14,
                        width: 12,
                      ),
                      const SizedBox(width: 7),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // TabBar
          Expanded(
            child: DefaultTabController(
              length: 2, // Two tabs
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: size.width,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color(0xffDCEAF6),
                        borderRadius: BorderRadius.circular(30)),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding:
                          EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      dividerColor: Colors.transparent,
                      labelColor: ksecndrycolor,
                      unselectedLabelColor: Colors.grey.shade900,
                      labelStyle: GoogleFonts.publicSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      indicatorColor: Colors.transparent,
                      tabs: const [
                        Tab(text: "All Transaction"),
                        Tab(text: "Pending"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "1-Jan-2025",
                                style: GoogleFonts.publicSans(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                            AllTransactionTab(),
                              // Tab 2 content
                              Center(child: Text("Pending Transactions")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
