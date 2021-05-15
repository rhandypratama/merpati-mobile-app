import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mprj/constants/app_themes.dart';
/*
FormInputFieldWithIcon(
                controller: _email,
                iconPrefix: Icons.link,
                labelText: 'Post URL',
                validator: Validator.notEmpty,
                keyboardType: TextInputType.multiline,
                minLines: 3,
                onChanged: (value) => print('changed'),
                onSaved: (value) => print('implement me'),
              ),
*/

class FormInputFieldWithIcon extends StatelessWidget {
  FormInputFieldWithIcon(
      {required this.controller,
      required this.iconPrefix,
      required this.labelText,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.minLines = 1,
      this.maxLines,
      required this.onChanged,
      required this.onSaved});

  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int? maxLines;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(AppThemes.kPaddingM),
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
        hintText: labelText,
        hintStyle: GoogleFonts.openSans(
          textStyle: TextStyle(
            color: AppThemes.kBlack.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )
        ),
        prefixIcon: Icon(
          iconPrefix,
          color: AppThemes.kBlack.withOpacity(0.5),
        ),
      ),
      // decoration: InputDecoration(
      //   filled: true,
      //   prefixIcon: Icon(iconPrefix),
      //   labelText: labelText,
      // ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
    );
  }
}
