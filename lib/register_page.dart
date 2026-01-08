import 'package:flutter/material.dart';
import 'main.dart'; // 👈 نفس القائمة

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  String error = "";

  void register() {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      setState(() {
        error = "جميع الحقول مطلوبة";
      });
      return;
    }

    if (passwordController.text != confirmController.text) {
      setState(() {
        error = "كلمتا المرور غير متطابقتين";
      });
      return;
    }

    bool exists =
        users.any((u) => u["username"] == usernameController.text);

    if (exists) {
      setState(() {
        error = "اسم المستخدم موجود مسبقاً";
      });
      return;
    }

    users.add({
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إنشاء حساب")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: "اسم المستخدم")),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "البريد الإلكتروني")),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "كلمة المرور")),
            TextField(
                controller: confirmController,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: "تأكيد كلمة المرور")),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: register, child: const Text("إنشاء الحساب")),
            const SizedBox(height: 10),
            Text(error, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}