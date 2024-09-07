import 'package:cutflow/views/auth_page.dart';
import 'package:cutflow/views/home_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';

  static final List<GetPage> routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => AuthPage(isLogin: true)), // Connexion
    GetPage(name: signup, page: () => AuthPage(isLogin: false)), // Inscription
  ];
}
