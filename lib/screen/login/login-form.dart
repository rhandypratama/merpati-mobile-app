import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:merpati/utils/constant.dart';
import 'package:merpati/utils/widget-model.dart';
import 'package:merpati/utils/fade-slide-transition.dart';
import 'package:merpati/utils/custom-button.dart';
import 'package:merpati/utils/custom-input-field.dart';
import 'package:merpati/utils/custom-password-field.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;
  

  const LoginForm({@required this.animation}) : assert(animation != null);

  // AnimationController _rippleAnimationController;

  updateLocale(Locale locale, BuildContext context) {
    Navigator.of(context).pop();
    Get.updateLocale(locale);
  }

  showLocalDialog(BuildContext context) {
    final locales = [
      {'name': 'English', 'local': Locale('en', 'US')},
      {'name': 'Indonesia', 'local': Locale('in', 'ID')},
    ];

    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text('Choose your language'),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, idx) => InkWell(
              child: Text(locales[idx]['name']),
              onTap: () => {
                updateLocale(locales[idx]['locale'], context)
              },
            ), 
            separatorBuilder: (context, idx) => Divider(color: Colors.black), 
            itemCount: 2
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: CustomInputField(
              label: 'Username or Email',
              prefixIcon: Icons.person_outline,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: CustomPasswordField(
              label: 'Password',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: GestureDetector(
              child: Align(
                alignment: Alignment.centerRight,
                child: dynamicText("Forgot Password", fontSize: 14, color: kBlue),
              ),
              onTap: () async {
                // navigationManager(context, ForgotPassword(screenHeight: MediaQuery.of(context).size.height), isPushReplaced: false);
              },
            )
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: kBlue,
              textColor: kWhite,
              text: 'Login to continue',
              onPressed: () {
                // navigationManager(context, Home(), isPushReplaced: false);
              },
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: CustomButton(
              color: kWhite,
              textColor: kBlack.withOpacity(0.5),
              text: 'Sign in with Google',
              // image: SvgPicture.asset(
              //   kGoogleLogoPath,
              //   placeholderBuilder: (context) => CircularProgressIndicator(),
              //   height: 48,
              //   color: Colors.grey,
                
              // ),
              image: Image(
                image: AssetImage(kGoogleLogoPath),
                height: 28.0,
              ),
              onPressed: () {
                // navigationManager(context, Home(), isPushReplaced: false);
              },
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 3 * space,
            child: CustomButton(
              color: kWhite,
              textColor: kBlack.withOpacity(0.5),
              text: 'Sign in with Facebook',
              image: Image(
                image: AssetImage(kFacebookLogoPath),
                height: 28.0,
              ),
              onPressed: () {
                // navigationManager(context, Home(), isPushReplaced: false);
              },
            ),
          ),
          SizedBox(height: space),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 4 * space,
                child: dynamicText("Do you have an account?", fontSize: 14)
              ),
              SizedBox(width: 4),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 4 * space,
                child: GestureDetector(
                  child: dynamicText("Create Account", fontSize: 14, color: kBlue),
                  onTap: () async {
                    // navigationManager(context, Register(screenHeight: MediaQuery.of(context).size.height), isPushReplaced: false);
                  },
                )
              ),
            ],
          ),
          SizedBox(height: space),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FadeSlideTransition(
              //   animation: animation,
              //   additionalOffset: 4 * space,
              //   child: dynamicText("Your Language?", fontSize: 14)
              // ),
              // SizedBox(width: 4),
              FadeSlideTransition(
                animation: animation,
                additionalOffset: 4 * space,
                child: GestureDetector(
                  child: dynamicText("Choose Language", fontSize: 14, color: kBlue),
                  onTap: () {
                    showLocalDialog(context);
                  },
                )
              ),
            ],
          )
          
        ],
      ),
    );
  }
}