import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merpati/screen/login/login.dart';
import 'package:merpati/utils/translate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      translations: Translate(),
      locale: Get.deviceLocale,
      // home: Home(),
      home: Builder(
        builder: (BuildContext context) {
          var screenHeight = MediaQuery.of(context).size.height;
          // return Login(screenHeight: screenHeight);
          return Login(screenHeight: screenHeight);
        },
      ),
    
    );
  }
}