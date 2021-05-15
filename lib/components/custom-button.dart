import 'package:flutter/material.dart';
import 'package:mprj/constants/app_themes.dart';
import 'package:mprj/components/widget-model.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Widget? image;
  final VoidCallback onPressed;

  const CustomButton({
    required this.color,
    required this.textColor,
    required this.text,
    required this.onPressed,
    this.image,
  })  : assert(color != null),
        assert(textColor != null),
        assert(text != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      child: image != null
          ? OutlineButton(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: AppThemes.kPaddingM, top: AppThemes.kPaddingS, bottom: AppThemes.kPaddingS),
                    child: image,
                  ),
                  dynamicText(text, fontSize: 16, color: textColor, fontWeight: FontWeight.normal)
                ],
              ),
              onPressed: onPressed,
            )
          : FlatButton(
              color: color,
              padding: const EdgeInsets.all(AppThemes.kPaddingM),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: dynamicText(text, fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
              onPressed: onPressed,
            ),
    );
  }
}
