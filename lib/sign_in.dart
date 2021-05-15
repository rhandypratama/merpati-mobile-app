import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mprj/components/components.dart';
import 'package:mprj/controllers/auth_controller.dart';
import 'package:mprj/helpers/helpers.dart';

class SignInUI extends StatelessWidget {
  final AuthController authController = AuthController.to;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LogoGraphicHeader(),
                  SizedBox(height: 48.0),
                  FormInputFieldWithIcon(
                    controller: authController.emailController,
                    iconPrefix: Icons.email,
                    labelText: 'auth.emailFormField'.tr,
                    validator: Validator().email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.emailController.text = value!,
                  ),
                  FormVerticalSpace(),
                  FormInputFieldWithIcon(
                    controller: authController.passwordController,
                    iconPrefix: Icons.lock,
                    labelText: 'auth.passwordFormField'.tr,
                    validator: Validator().password,
                    // validator: ,
                    obscureText: true,
                    onChanged: (value) => null,
                    onSaved: (value) =>
                        authController.passwordController.text = value!,
                    maxLines: 1,
                  ),
                  FormVerticalSpace(),
                  PrimaryButton(
                    labelText: 'auth.signInButton'.tr,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        authController.signInWithEmailAndPassword(context);
                        // authController.signInWithGoogle();
                      }  
                    }
                  ),
                  FormVerticalSpace(),
                  CustomButton(
                    color: Colors.white,
                    textColor: Colors.black.withOpacity(0.5),
                    text: 'Sign in with Google',
                    image: Image(
                      image: AssetImage('assets/images/google-logo.png'),
                      height: 28.0,
                    ),
                    onPressed: () async {
                      // var isError = false;
                      authController.signInWithGoogle();
                      // await authController.signInWithGoogle().catchError((errorMessage) async {
                      //   isError = true;
                      //   if (errorMessage != 'CANCELLED_SIGN_IN') {
                      //     // await showPopup(context, title: 'Validation', child: Text(errorMessage));
                      //     print('error bro');
                      //   }                
                      // });
                    },
                  ),
                  // FormVerticalSpace(),
                  CustomButton(
                    color: Colors.white,
                    textColor: Colors.black.withOpacity(0.5),
                    text: 'Sign in with Facebook',
                    image: Image(
                      image: AssetImage('assets/images/facebook-logo.png'),
                      height: 28.0,
                    ),
                    onPressed: () {
                      authController.signInWithGoogle();
                    },
                  ),
                  FormVerticalSpace(),
                  // LabelButton(
                  //   labelText: 'auth.resetPasswordLabelButton'.tr,
                  //   onPressed: () => Get.to(ResetPasswordUI()),
                  // ),
                  // LabelButton(
                  //   labelText: 'auth.signUpLabelButton'.tr,
                  //   onPressed: () => Get.to(SignUpUI()),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
