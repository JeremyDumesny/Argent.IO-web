import 'package:cutflow/views/home_page.dart';
import 'package:cutflow/views/login_page.dart';
import 'package:cutflow/views/sign_up_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';

  static final List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: signup, page: () => SignupPage()),
  ];
}
