import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_structure/routes/route.dart';
import 'package:flutter_app_structure/screens/TodoHomeScreen.dart';
import 'package:flutter_app_structure/translation/traslations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.red, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(
      //   MaterialApp(
      //   title: 'My app', // used by the OS task switcher
      //   home: SafeArea(
      //     child: TodoHomeScreen(),
      //   ),
      // ));
      GetMaterialApp(
    // It is not mandatory to use named routes, but dynamic urls are interesting.
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.native,
    translations: MyTranslations(),
    locale: Locale('kh', 'KH'),
    getPages: routes,
  ));
}
