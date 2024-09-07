import 'package:cutflow/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  final bool isLogin; // Si vrai, la page agit comme une page de connexion
  AuthPage({super.key, required this.isLogin});

  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(isLogin ? 'Login' : 'Sign Up'), // Dynamique selon le contexte
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                authController.authenticate(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                  isLogin: isLogin, // Détermine si on se connecte ou s'inscrit
                );
              },
              child: Text(isLogin ? 'Login' : 'Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(isLogin
                    ? '/signup'
                    : '/login'); // Naviguer entre connexion et inscription
              },
              child: Text(isLogin
                  ? "Don't have an account? Sign up"
                  : 'Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
