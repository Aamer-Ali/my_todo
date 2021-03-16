import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_todo/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:my_todo/app/modules/authentication/models/user_model.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final AuthenticationController controller =
      Get.put(AuthenticationController(), permanent: true);

  var route = null;
  bool a = controller.isUserLogin();
  if (a == true) {
    route = Routes.HOME;
  } else {
    route = Routes.AUTHENTICATION;
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      initialRoute: route,
      getPages: AppPages.routes,
    ),
  );
}
