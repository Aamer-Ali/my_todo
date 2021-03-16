import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_todo/app/constants.dart';
import 'package:my_todo/app/modules/authentication/models/user_model.dart';
import 'package:my_todo/app/modules/authentication/views/login_view.dart';
import 'package:my_todo/app/modules/authentication/views/register_view.dart';
import 'package:my_todo/app/routes/app_pages.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          height: Constants.getHeight(context) * 0.5,
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () {
                    if (controller.switchView.value) {
                      return LoginView();
                    } else {
                      return RegisterView();
                    }
                  },
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx((){
                    return Text(
                      controller.switchView.value ? "Register" : "Login",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    );
                  }),
                ),
                onTap: () {
                  controller.switchView.value = !controller.switchView.value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
