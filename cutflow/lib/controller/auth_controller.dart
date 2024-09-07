import 'package:cutflow/models/user/user.model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<UserModel?> firebaseUser = Rxn<UserModel?>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges().map((user) {
      if (user != null) {
        return UserModel(id: user.uid, email: user.email);
      }
      return null;
    }));
  }

  Future<void> authenticate({
    required String email,
    required String password,
    required bool isLogin,
  }) async {
    try {
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar('Login Successful', 'Welcome back $email!');
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar('Signup Successful', 'Account created for $email!');
      }
      Get.offNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
          'Error', e.message ?? 'An error occurred during authentication');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/login');
      Get.snackbar('Signout Successful', 'You have been logged out.');
    } catch (e) {
      Get.snackbar('Signout Failed', 'An error occurred during signout.');
    }
  }
}
