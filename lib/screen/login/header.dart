import 'package:flutter/material.dart';
import 'package:merpati/utils/fade-slide-transition.dart';
import 'package:merpati/utils/constant.dart';
import 'package:merpati/utils/logo.dart';
import 'package:merpati/utils/widget-model.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({@required this.animation}) : assert(animation != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Logo(
            color: kBlue,
            size: 58.0,
          ),
          const SizedBox(height: kSpaceM),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: dynamicText('login_title'.tr, fontWeight: FontWeight.bold, fontSize: 24)
            // child: Text('login_title'.tr)
          ),
          const SizedBox(height: kSpaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: dynamicText('login_sub_title'.tr, fontSize: 14)
            // child: Text('login_sub_title'.tr)
          ),
        ],
      ),
    );
  }
}