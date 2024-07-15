import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';
class RegisterFooter extends StatelessWidget{
  const RegisterFooter({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => Get.to(() => const LoginScreen()), 
          child: const Text.rich(
            TextSpan(
              text: "Already have an account? ",
              children: [
                TextSpan(
                  text: "Sign in",
                )
              ]
            )
          ), 
          
        ),
      ],
    );
  }
}