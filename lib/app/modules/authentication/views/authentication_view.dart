import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_todo/app/constants.dart';
import 'package:my_todo/app/modules/authentication/models/user_model.dart';
import 'package:my_todo/app/routes/app_pages.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  var _validate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        height: Constants.getHeight(context),
        width: Constants.getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return TextField(
                onChanged: (val) {
                  controller.username.value = val;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    errorText: controller.isUsernameValid.value
                        ? null
                        : "Please Enter Username"),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Obx(() {
              return TextField(
                onChanged: (val) {
                  controller.password.value = val;
                },
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    errorText: controller.isPasswordValid.value
                        ? null
                        : "Please Enter Password"),
              );
            }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                controller.formValidation();
                if (controller.isUsernameValid.value &&
                    controller.isPasswordValid.value) {
                  print('Validation complete... ');
                  print('Verification gets started ... ');
                }
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.signInAnon().then((value) {
                  if (value.uid != null) {
                    Get.toNamed(Routes.HOME);
                  }
                });
              },
              child: Text("Login Anonymously"),
            ),
          ],
        ),
      ),
    );
  }
}
