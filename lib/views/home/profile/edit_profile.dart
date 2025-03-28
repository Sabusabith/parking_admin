import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/get_profile_controller.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/update_profile_controller.dart';

import '../../../utils/common/appcolors.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key, required this.firstName, required this.lastName});

  String firstName;
  String lastName;

  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var nameController = TextEditingController(
        text:
            "${firstName != "null" ? firstName : "Enter Name"} ${lastName != "null" ? lastName : ""}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimerycolor,
        leading: SizedBox(),
        toolbarHeight: 10,
      ),
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
                    Stack(children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/images/prf.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          right: 1,
                          bottom: 2,
                          child: Image.asset(
                            "assets/images/editcam.png",
                            height: 25,
                          ))
                    ]),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Container(
                          width: size.width,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Color(0xffFFD900),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: TextField(
                              style: GoogleFonts.caveat(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.center,
                              controller: nameController,
                              //////////////
                              // onChanged: (value) {
                              //   setState(() {});
                              //   // Rebuild when user types
                              // },
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          )),
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
                      GestureDetector(
                        onTap: () {
                          updateData(nameController);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 55,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: kgrey2tilecolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
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
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 55,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: kgrey2tilecolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 55,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: kgrey2tilecolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
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
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Space between the containers
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Cancel', // Optional text inside the button
                                      style: GoogleFonts.publicSans(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15, // Space between the buttons
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    updateData(nameController);
                                    // controller.fetchProfile();
                                    // Get.back();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: kprimerycolor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Save  Changes', // Optional text inside the button
                                        style: GoogleFonts.publicSans(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
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

  void updateData(TextEditingController controller) {
    String name = controller.text.trim(); // Trim extra spaces
    List<String> nameParts = name.split(' '); // Split by space

    String firstName = '';
    String lastName = '';

    if (nameParts.length > 1) {
      firstName = nameParts.first; // First word as First Name
      lastName = nameParts.sublist(1).join(' '); // Remaining as Last Name
    } else {
      firstName = name; // Only first name is present
      lastName = ''; // No last name
    }

    // Creating a Map with extracted names
    Map<String, String> data = {"first_name": firstName, "last_name": lastName};

    print(data); // Debugging (Optional: You can use it as needed)

    updateProfileController.editProfile(data);
  }
}
