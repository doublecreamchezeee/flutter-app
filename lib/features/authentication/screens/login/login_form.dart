import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/authentication/controllers/login_controller.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_forget_pw_modal.dart';
import 'package:flutter_application_1/ui.dart';
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
              BoxInputField(
                controller: controller.email,
                leading: const Icon(Icons.person),
                placeholder: "Enter username",
              ),
              const SizedBox(height: 20),
              BoxInputField(
                controller: controller.password,
                leading: const Icon(Icons.password),
                password: true,
                placeholder: "Enter password",
              ),
              const SizedBox(height: 10),
            ])),
        const SizedBox(height: 10),
        const LoginForgetPWModal(),
        SizedBox(
          width: double.infinity,
          child: BoxButton(
            title: tSigninBtn,
            onTap: () {
              if (formKey.currentState!.validate()) {
                LoginController.instance.loginUser(controller.email.text.trim(),
                    controller.password.text.trim());
              }
            },
          ),
        ),
        const SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.center,
            child: BoxText.caption("OR"),
          ),
        ),
        const SizedBox(
            width: double.infinity,
            child: BoxButton.outline(title: tSigninWGgBtn)),
      ],
    );
  }
}
