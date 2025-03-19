import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/get_profile_controller.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/update_profile_controller.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';
import 'package:parking_app_admin/views/home/bank_details/bankdetails.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  GetProfileController controller = Get.put(GetProfileController());
  UpdateProfileController _controller = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var firstname = controller.profileModel?.data.user.firstName.toString();
    var lastname = controller.profileModel?.data.user.lastName.toString();
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 3.4,
              decoration: BoxDecoration(
                  color: kprimerycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(
                        "assets/images/prf.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      (firstname != null &&
                                  firstname != "null" &&
                                  firstname.isNotEmpty) ||
                              (lastname != null &&
                                  lastname != "null" &&
                                  lastname.isNotEmpty)
                          ? "${firstname != "null" ? firstname : ""} ${lastname != "null" ? lastname : ""}"
                              .trim()
                          : "Harikrishna",
                      style: GoogleFonts.caveat(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    InkWell(
                      onTap: () {
                        /// navigate to edit profile screen
                        _controller.editProfile(
                            firstName: "rahul", lastName: "astralogic");
                      },
                      child: Container(
                        width: 78,
                        height: 26,
                        decoration: BoxDecoration(
                            color: Color(0xffFFD900),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: GoogleFonts.publicSans(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade900,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                color: kbgcolor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Personal Details",
                              style: GoogleFonts.publicSans(
                                  color: Colors.grey.shade900,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 172,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: kgrey2tilecolor,
                            borderRadius: BorderRadius.circular(24)),
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            ListTile(
                              minTileHeight: 40,
                              leading: SvgPicture.asset(
                                "assets/icons/phone.svg",
                                height: 30,
                              ),
                              title: Text(
                                "+91 9539324400",
                                style: GoogleFonts.publicSans(
                                    color: Colors.grey.shade900,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: Container(
                                width: 40,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: Color(0xffFEC107),
                                    borderRadius: BorderRadius.circular(33)),
                                child: Center(
                                  child: Text(
                                    "Change",
                                    style: GoogleFonts.publicSans(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade900),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Transform(
                                  transform:
                                      Matrix4.translationValues(0, -3, 0),
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  )),
                            ),
                            ListTile(
                              minTileHeight: 35,
                              leading: SvgPicture.asset(
                                "assets/icons/msg.svg",
                                height: 30,
                              ),
                              title: Text(
                                "Parkingapptest.com",
                                style: GoogleFonts.publicSans(
                                    color: Colors.grey.shade900,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Transform(
                                transform: Matrix4.translationValues(0, -2, 0),
                                child: Divider(
                                  color: Colors.grey.shade300,
                                  thickness: 1,
                                ),
                              ),
                            ),
                            ListTile(
                              minTileHeight: 35,
                              leading: SvgPicture.asset(
                                "assets/icons/id.svg",
                                height: 30,
                              ),
                              title: Text(
                                "Bangalore-HSR Layout-11",
                                style: GoogleFonts.publicSans(
                                    color: Colors.grey.shade900,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Bank details.....
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Bank Details",
                              style: GoogleFonts.publicSans(
                                  color: Colors.grey.shade900,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Bankdetails());
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: size.width,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: kgrey2tilecolor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/axis.png",
                                  height: 28,
                                  width: 42.07,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "AXIS Bank",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 10,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "*******6191",
                                      style: GoogleFonts.publicSans(
                                          fontSize: 8,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          color: kgreencolor,
                                          borderRadius:
                                              BorderRadius.circular(33)),
                                      child: Center(
                                        child: Text(
                                          "Active",
                                          style: GoogleFonts.publicSans(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/arrowright.svg",
                                      height: 20,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Wallet details.....
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Wallet Details",
                              style: GoogleFonts.publicSans(
                                  color: Colors.grey.shade900,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        width: size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: kgrey2tilecolor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/wallet3.svg",
                                height: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Wallet ID",
                                    style: GoogleFonts.publicSans(
                                        fontSize: 8,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "PRK16788001",
                                    style: GoogleFonts.publicSans(
                                        fontSize: 10,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Wallet Amount",
                                        style: GoogleFonts.publicSans(
                                            fontSize: 8,
                                            color: Colors.grey.shade900,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "750.22",
                                        style: GoogleFonts.publicSans(
                                            fontSize: 10,
                                            color: ksecndrycolor,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    width: 68,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: kprimerycolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Withdraw",
                                        style: GoogleFonts.publicSans(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade900),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "APP VERSION V1.0.0",
                        style: GoogleFonts.publicSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Color(0xffA09B9B)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
