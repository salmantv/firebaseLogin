import 'package:get/get.dart';

import 'package:loginapp/app/modules/home/bindings/home_binding.dart';
import 'package:loginapp/app/modules/home/views/home_view.dart';
import 'package:loginapp/app/modules/loginPage/bindings/login_page_binding.dart';
import 'package:loginapp/app/modules/singUpPage/bindings/sing_up_page_binding.dart';
import 'package:loginapp/app/modules/singUpPage/views/sing_up_page_view.dart';

import '../modules/loginPage/views/login_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => SignupPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.SING_UP_PAGE,
      page: () => SingUpPageView(),
      binding: SingUpPageBinding(),
    ),
  ];
}
