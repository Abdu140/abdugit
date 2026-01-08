import 'package:flutter/material.dart';

import 'main.dart';          // 👈 للوصول إلى users
import 'register_page.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String error = "";

  void login() {
    final user = users.firstWhere(
      (u) =>
          u["username"] == usernameController.text &&
          u["password"] == passwordController.text,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainPage(
username: usernameController.text

        )),
      );
    } else {
      setState(() {
        error = "اسم المستخدم أو كلمة المرور غير صحيحة";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تسجيل الدخول")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "اسم المستخدم"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "كلمة المرور"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text("تسجيل الدخول")),
            const SizedBox(height: 10),
            Text(error, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                );
              },
              child: const Text(
                "إنشاء حساب",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}