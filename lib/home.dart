import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mprj/components/components.dart';
import 'package:mprj/components/widget-model.dart';
import 'package:mprj/constants/app_themes.dart';
import 'package:mprj/controllers/controllers.dart';
import 'package:mprj/settings.dart';
import 'package:mprj/ui/scan/scan.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => controller.firestoreUser.value!.uid == null
      // builder: (controller) => 
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text('home.title'.tr),
                actions: [
                  IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Get.to(SettingsUI());
                      }),
                ],
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40),
                      // GoogleUserCircleAvatar(
                      //   identity: controller.firestoreUser.value!,
                      // ),
                      Avatar(controller.firestoreUser.value!),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          FormVerticalSpace(),
                          // Text(
                          //     'home.uidLabel'.tr +
                          //         ': ' +
                          //         controller.firestoreUser.value!.uid,
                          //     style: TextStyle(fontSize: 16)),
                          // FormVerticalSpace(),
                          // dynamicText('home.nameLabel'.tr + ': ' + controller.firestoreUser.value!.name),
                          dynamicText(controller.firestoreUser.value!.name, fontSize: 28),
                          // FormVerticalSpace(),
                          // Text(
                          //     'home.emailLabel'.tr +
                          //         ': ' +
                          //         controller.firestoreUser.value!.email,
                          //     style: TextStyle(fontSize: 16)),
                          dynamicText(controller.firestoreUser.value!.email),
                          FormVerticalSpace(),
                          FormVerticalSpace(),
                          // Text(
                          //     'home.adminUserLabel'.tr +
                          //         ': ' +
                          //         controller.admin.value.toString(),
                          //     style: TextStyle(fontSize: 16)),
                          CustomButton(
                            color: AppThemes.kLightBlue, 
                            textColor: AppThemes.kWhite, 
                            text: 'Scan your QR Code', 
                            // image: Icon(Icons.qr_code_outlined),
                            onPressed: () {
                              Get.to(Scan());
                            }
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
