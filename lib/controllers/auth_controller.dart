import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/isar_service.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isarService = IsarService();

  // Kayıt işlemi
  Future<void> registerUser() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Hata", "Lütfen tüm alanları doldurun.");
      return;
    }

    final existing = await isarService.getUserByEmail(email);
    if (existing != null) {
      Get.snackbar("Hata", "Bu e-posta zaten kayıtlı.");
      return;
    }

    final newUser = UserModel()
      ..name = name
      ..email = email
      ..password = password;

    await isarService.addUser(newUser);

    Get.snackbar("Başarılı", "Kayıt başarılı!");
    clearForm();
    Get.offNamed('/auth');
  }

  // Giriş işlemi
  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Hata", "Lütfen tüm alanları doldurun.");
      return;
    }

    final user = await isarService.getUserByEmail(email);

    if (user == null || user.password != password) {
      Get.snackbar("Hata", "Geçersiz e-posta veya şifre.");
      return;
    }

    Get.snackbar("Giriş Başarılı", "Hoş geldin ${user.name}");
    clearForm();
    // TODO: Anasayfaya yönlendir
    // Get.offAllNamed('/home');
  }

  // TextField verilerini temizler
  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
