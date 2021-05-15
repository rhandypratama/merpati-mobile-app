import 'package:flutter/material.dart';
// import 'package:merpati/utils/widget-model.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Widget image;
  final VoidCallback onPressed;
  // double kPaddingS;
  // double kPaddingM;

  CustomButton({
    required this.color,
    required this.textColor,
    required this.text,
    required this.onPressed,
    required this.image,
    // required this.kPaddingM,
    // required this.kPaddingS,
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
                    padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                    child: image,
                  ),
                  // dynamicText(text, fontSize: 14, color: textColor, fontWeight: FontWeight.bold)
                  Text(text)
                ],
              ),
              onPressed: onPressed,
            )
          : FlatButton(
              color: color,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              // child: dynamicText(text, fontSize: 14, color: textColor, fontWeight: FontWeight.bold),
              child: Text(text),
              onPressed: onPressed,
            ),
    );
  }
}
