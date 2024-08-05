import 'package:flutter/cupertino.dart';
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
            Row( 
              children: [
                Expanded(
                  child: BoxInputField(
                    controller: controller.firstName,
                    leading: const Icon(Icons.text_fields),
                    placeholder: "First name",
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: BoxInputField(
                    controller: controller.lastName,
                    leading: const Icon(Icons.text_fields),
                    placeholder: "Last name",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            BoxInputField(
              controller: controller.username,
              leading: const Icon(Icons.account_balance),
              placeholder: "Username",
            ),
            const SizedBox(height: 12),
            BoxInputField(
              controller: controller.password,
              leading: const Icon(Icons.password),
              password: true,
              placeholder: "Password",
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SizedBox(
                  width: 110,
                  child: BoxInputField(
                    controller: controller.city,
                    leading: const Icon(Icons.location_city),
                    placeholder: "City",
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: BoxInputField(
                    controller: controller.dateDob,
                    placeholder: "DD",
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: BoxInputField(
                    controller: controller.monthDob,
                    placeholder: "MM",
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: BoxInputField(
                    controller: controller.yearDob,
                    placeholder: "YYYY",
                  ),
                ),
              ]
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: BoxButton(
                  title: tRegister,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      RegisterController.instance.registerUser(
                        controller.username.text.trim(),
                        controller.password.text.trim(),
                        controller.firstName.text.trim(),
                        controller.lastName.text.trim(),
                        controller.dateDob.text.trim(),
                        controller.monthDob.text.trim(),
                        controller.yearDob.text.trim(),
                        controller.city.text.trim(),
                      );
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
