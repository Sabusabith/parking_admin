import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/common/appcolors.dart';

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade200.withOpacity(.8),
        highlightColor: Colors.grey.shade300,
        child: Container(
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
                        "dsfgfsgfdg",
                        style: GoogleFonts.caveat(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 78,
                          height: 26,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
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
              SizedBox(height: 15,),
                Expanded(
                        child: Container(
                          width: size.width,
                        
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "",
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
                                              
                                              borderRadius:
                                                  BorderRadius.circular(33)),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Transform(
                                            transform:
                                                Matrix4.translationValues(
                                                    0, -3, 0),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Transform(
                                          transform: Matrix4.translationValues(
                                              0, -2, 0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "",
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
                                  
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    width: size.width,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: kgrey2tilecolor),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "AXIS Bank",
                                                style: GoogleFonts.publicSans(
                                                    fontSize: 10,
                                                    color: Colors.grey.shade900,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                "*******6191",
                                                style: GoogleFonts.publicSans(
                                                    fontSize: 8,
                                                    color: Colors.grey.shade900,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    color: kgreencolor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            33)),
                                                child: Center(
                                                  child: Text(
                                                    "Active",
                                                    style:
                                                        GoogleFonts.publicSans(
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "",
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                       
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Wallet Amount",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 8,
                                                      color:
                                                          Colors.grey.shade900,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "750.22",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 10,
                                                      color: ksecndrycolor,
                                                      fontWeight:
                                                          FontWeight.w900),
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
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Text(
                                                  "Withdraw",
                                                  style: GoogleFonts.publicSans(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade900),
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
        ));
  }
}
