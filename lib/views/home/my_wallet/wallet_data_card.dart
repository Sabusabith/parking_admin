import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class WalletDataCard extends StatelessWidget {
  const WalletDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      left: 20,
      right: 20,
      top: 50,
      child: Container(
        width: size.width,
        height: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28), color: Colors.white),
        child: Row(
          children: [
            Expanded(
              child: Container(
             
                height: 200,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Wallet2.svg",
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "My Wallet",
                                style: GoogleFonts.publicSans(
                                    fontSize: 11.84,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade600),
                              ),
                              Text(
                                "PRK16788001",
                                style: GoogleFonts.publicSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade900),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //balance in account
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "₹ 101256.50",
                            style: GoogleFonts.publicSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: ksecndrycolor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            "assets/icons/Eye.svg",
                            height: 17,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/arrowup.svg",
                            height: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "+100",
                            style: GoogleFonts.publicSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: kgreencolor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Jan 2025 11.30AM",
                            style: GoogleFonts.publicSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //transferlimit
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Transfer Limit weekly: 7",
                            style: GoogleFonts.publicSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade900),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            "assets/icons/about.svg",
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _withdrawDialogue(context, size);
                            },
                            child: Container(
                              width: 82,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: kprimerycolor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Withdraw",
                                  style: GoogleFonts.publicSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade900),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                "Transfer left: 7/7",
                                style: GoogleFonts.publicSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700),
                                    overflow: TextOverflow.ellipsis,
                                    
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 215,
              width: 140,
              child: Stack(children: [
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          "assets/images/divider.png",
                          fit: BoxFit.cover,
                          height: 215,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: SvgPicture.asset(
                    "assets/icons/arrowright.svg",
                    height: 19.73,
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
             width: 120,height: 120,
                    decoration: BoxDecoration(     
                        image: DecorationImage(
                            image: AssetImage(
                      "assets/images/brick.png",
                    ))),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  _withdrawDialogue(BuildContext context, Size size) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Withdraw"),
            content: Text("Withdraw Success.."),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 45,
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: kprimerycolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "Done",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
