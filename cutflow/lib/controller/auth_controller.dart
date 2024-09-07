import 'package:get/get.dart';

class AuthController extends GetxController {
  void login(String email, String password) {
    if (email == "test@example.com" && password == "password") {
      Get.snackbar('Login Successful', 'Welcome $email!');
      Get.offNamed('/home');
    } else {
      Get.snackbar('Login Failed', 'Invalid credentials');
    }
  }

  void signUp(String email, String password) {
    Get.snackbar('Signup Successful', 'Account created for $email!');
    Get.offNamed('/home');
  }
}
