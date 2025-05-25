import 'package:get/get.dart';
import '../views/auth/login_view.dart';
import '../views/auth/register_view.dart';
import '../views/home/home_view.dart';
import '../bindings/auth_binding.dart';

class AppRoutes {
  static const auth = '/auth';
  static const register = '/register';
  static const home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.auth,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
    ),
  ];
}
