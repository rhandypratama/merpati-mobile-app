import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merpati/utils/constant.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final bool obscureText;

  const CustomInputField({@required this.label, @required this.prefixIcon, this.obscureText = false})
  : assert(label != null),
  assert(prefixIcon != null);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(kPaddingM),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
            width: 1
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
            width: 1
          ),
        ),
        hintText: label,
        hintStyle: GoogleFonts.openSans(
          textStyle: TextStyle(
            color: kBlack.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: kBlack.withOpacity(0.5),
        ),
      ),
      // obscureText: obscureText,
    );
  }
}