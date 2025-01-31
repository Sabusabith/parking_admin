import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/common/appcolors.dart';

class Timefiled extends StatelessWidget {
   Timefiled({super.key,required this.hint});
String hint;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                      width: 80,
                      height: 34,
                      child: TextField(
                        cursorColor: Colors.grey.shade800,
                        cursorHeight: 15,
                        maxLines: 1,
                        decoration: InputDecoration(
                          
                            hintText: hint,
                            hintStyle: GoogleFonts.publicSans(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: ksecndrycolor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: ksecndrycolor))),
                      ),
                    );
  }
}