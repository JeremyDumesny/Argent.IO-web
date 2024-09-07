import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User?> firebaseUser = Rxn<User?>(); // Obtenir l'état de l'utilisateur

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  // Méthode générique pour l'authentification (connexion ou inscription)
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
      Get.offNamed('/home'); // Rediriger vers la page d'accueil
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
          'Error', e.message ?? 'An error occurred during authentication');
    }
  }

  // Méthode générique pour la déconnexion
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(
          '/login'); // Rediriger vers la page de connexion après déconnexion
      Get.snackbar('Signout Successful', 'You have been logged out.');
    } catch (e) {
      Get.snackbar('Signout Failed', 'An error occurred during signout.');
    }
  }
}
