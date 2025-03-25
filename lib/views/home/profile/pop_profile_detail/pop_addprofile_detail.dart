import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/controllers/profile_controller/update_profile_controller.dart';

import '../../../../utils/common/appcolors.dart';

class PopAddprofileDetail extends StatelessWidget {
  PopAddprofileDetail({super.key});
UpdateProfileController updateProfileController = Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return _onPopProfile(context,controller );
  }


  _onPopProfile(BuildContext context , TextEditingController nameController) {
    showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Dialog(
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                        color: kprimerycolor,
                        borderRadius: BorderRadius.circular(10)),
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
                              
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 25,
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
                ),
                  ),
                ),
              );
            },
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