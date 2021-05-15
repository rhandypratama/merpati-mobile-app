import 'package:flutter/material.dart';
import 'package:mprj/components/logo.dart';
import 'package:mprj/components/widget-model.dart';
import 'package:mprj/constants/app_themes.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  // final Animation<double> animation;

  // const Header({required this.animation}) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppThemes.kPaddingS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Logo(
            color: AppThemes.kBlue,
            size: 78.0,
          ),
          const SizedBox(height: AppThemes.kSpaceM),
          dynamicText('auth.signInButton'.tr, fontWeight: FontWeight.bold, fontSize: 24),
          const SizedBox(height: AppThemes.kSpaceS),
          dynamicText('auth.signSubTitle'.tr, fontSize: 14),
        ],
      ),
    );
  }
}