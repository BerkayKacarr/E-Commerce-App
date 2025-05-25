import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Yap")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'E-posta'),
            ),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Şifre'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.loginUser(),
              child: const Text("Giriş Yap"),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Get.toNamed('/register');
              },
              child: const Text("Hesabınız yok mu? Kayıt olun."),
            ),
          ],
        ),
      ),
    );
  }
}
