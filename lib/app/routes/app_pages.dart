import 'package:get/get.dart';

import 'package:skype_clone/app/modules/home/bindings/home_binding.dart';
import 'package:skype_clone/app/modules/home/views/home_view.dart';
import 'package:skype_clone/app/modules/splash/bindings/splash_binding.dart';
import 'package:skype_clone/app/modules/splash/views/splash_view.dart';
import 'package:skype_clone/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:skype_clone/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
