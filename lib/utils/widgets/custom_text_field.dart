import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/appcolors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hint, required this.maxlines,required this.controller,required this.size,required this.contntpadding});
  String hint;
  var maxlines;
  double contntpadding;
  TextEditingController controller;
  double size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SizedBox(
        height: size,
        child: TextField(
          maxLines: maxlines,
          controller: controller,
          cursorColor: Colors.grey.shade800,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, bottom: 5,top: contntpadding),
              hintText: hint,
              hintStyle: GoogleFonts.publicSans(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ksecndrycolor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ksecndrycolor))),
        ),
      ),
    );
  }
}
