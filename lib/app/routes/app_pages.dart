import 'package:get/get.dart';

import 'package:my_todo/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:my_todo/app/modules/authentication/views/authentication_view.dart';
import 'package:my_todo/app/modules/home/bindings/home_binding.dart';
import 'package:my_todo/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
  ];
}
