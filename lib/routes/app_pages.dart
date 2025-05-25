import 'package:ecommerce_app/bindings/auth_bindings.dart';
import 'package:get/get.dart';
import '../views/auth/login_view.dart';
import '../views/auth/register_view.dart';
import '../bindings/auth_binding.dart';

class AppRoutes {
  static const auth = '/auth';
  static const register = '/register';
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
  ];
}
