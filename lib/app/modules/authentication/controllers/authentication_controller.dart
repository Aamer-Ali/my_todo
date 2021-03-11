import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController

  var username = "".obs;
  var password = "".obs;
  var isUsernameValid = true.obs;
  var isPasswordValid = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void formValidation() {
    userValidation();
    passwordValidation();
  }

  void userValidation() {
    if (username.isEmpty) {
      isUsernameValid.value = false;
    } else {
      isUsernameValid.value = true;
    }
  }

  void passwordValidation() {
    if (password.isEmpty) {
      isPasswordValid.value = false;
    } else {
      isPasswordValid.value = true;
    }
  }
}
