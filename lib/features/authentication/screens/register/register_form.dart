import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/authentication/controllers/register_controller.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:get/get.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: formKey,
          child: Column(children: [
            BoxInputField(
              controller: controller.fullName,
              leading: const Icon(Icons.text_fields),
              placeholder: "Enter full name",
            ),
            const SizedBox(height: 12),
            BoxInputField(
              controller: controller.email,
              leading: const Icon(Icons.email),
              placeholder: "Enter email",
            ),
            const SizedBox(height: 12),
            BoxInputField(
              controller: controller.phone,
              leading: const Icon(Icons.phone),
              placeholder: "Enter phone number",
            ),
            const SizedBox(height: 12),
            BoxInputField(
              controller: controller.password,
              leading: const Icon(Icons.password),
              password: true,
              placeholder: "Enter password",
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: BoxButton(
                  title: tRegister,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      RegisterController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                )),
            const SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: BoxText.caption("OR"),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: BoxButton.outline(title: tSignupWGgBtn)
            ),
          ])),
    );
  }
}
