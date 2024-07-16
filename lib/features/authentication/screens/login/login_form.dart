import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/login_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_forget_pw_modal.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        Form(
            key: formKey,
            child: Column(children: [
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Email / Phone / Username',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: OutlineInputBorder()),
              ),
            ])),
        const SizedBox(height: 10),
        const LoginForgetPWModal(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  LoginController.instance.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                }
              },
              child: const Text("Sign in")),
        ),
        const SizedBox(
          height: 30,
          child: Align(
            alignment: Alignment.center,
            child: Text("OR"),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {}, child: const Text("Sign in with Google")),
        ),
      ],
    );
  }
}
