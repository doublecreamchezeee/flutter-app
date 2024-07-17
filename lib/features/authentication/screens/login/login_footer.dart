import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_screen.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:get/get.dart';
class LoginFooter extends StatelessWidget{
  const LoginFooter({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => Get.to(() => const RegisterScreen()), 
          child: const BoxText.caption(tSignUpNavigate)
        ),
      ],
    );
  }
}