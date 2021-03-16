import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_todo/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:my_todo/app/routes/app_pages.dart';

import '../../../constants.dart';

class LoginView extends GetView<AuthenticationController> {
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
              Text(
                "Login",
                style: TextStyle(color: Colors.blueAccent, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return TextField(
                  onChanged: (val) {
                    controller.username.value = val;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
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
                    controller.signInWithEmailPassword();
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
