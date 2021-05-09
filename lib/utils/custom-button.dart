import 'package:flutter/material.dart';
import 'package:merpati/utils/constant.dart';
import 'package:merpati/utils/widget-model.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Widget image;
  final VoidCallback onPressed;

  const CustomButton({
    @required this.color,
    @required this.textColor,
    @required this.text,
    @required this.onPressed,
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
                    padding: const EdgeInsets.only(right: kPaddingM, top: kPaddingS, bottom: kPaddingS),
                    child: image,
                  ),
                  dynamicText(text, fontSize: 14, color: textColor, fontWeight: FontWeight.bold)
                ],
              ),
              onPressed: onPressed,
            )
          : FlatButton(
              color: color,
              padding: const EdgeInsets.all(kPaddingM),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: dynamicText(text, fontSize: 14, color: textColor, fontWeight: FontWeight.bold),
              onPressed: onPressed,
            ),
    );
  }
}
