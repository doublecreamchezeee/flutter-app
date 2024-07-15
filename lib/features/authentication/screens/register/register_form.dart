import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/register_controller.dart';
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
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Full Name',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.phone,
              decoration: const InputDecoration(
                  labelText: 'Phone No',
                  hintText: 'Phone No',
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
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      RegisterController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                  child: const Text("Sign up")),
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
                  onPressed: () {}, child: const Text("Sign up with Google")),
            ),
          ])),
    );
  }
}
