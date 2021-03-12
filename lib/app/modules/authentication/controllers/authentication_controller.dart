import 'package:get/get.dart';
import 'package:my_todo/app/modules/authentication/models/user_model.dart';
import 'package:my_todo/app/services/firebase_services/authentication_services.dart';

class AuthenticationController extends GetxController {
  //TODO: Implement AuthenticationController

  var username = "".obs;
  var password = "".obs;
  var isUsernameValid = true.obs;
  var isPasswordValid = true.obs;
  final AuthenticationServices services = AuthenticationServices();
  var isLoginSuccess = false.obs;

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

  Future<UserModel> signInAnon() {
   return services.signInAnon();
  }

  Future signOut() async {
    await services.signOut();
  }

  bool isUserLogin() {
    return services.isUserLogin();
  }

// Future<Stream<UserModel>> isUserLogin() async {
//   return services.user;
// }
}
