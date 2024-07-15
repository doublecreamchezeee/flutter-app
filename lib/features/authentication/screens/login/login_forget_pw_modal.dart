import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/features/authentication/screens/verification/verify_email.dart';
import 'package:flutter_application_1/features/authentication/screens/verification/verify_phone.dart';
import 'package:get/get.dart';

class LoginForgetPWModal extends StatelessWidget{
  const LoginForgetPWModal({super.key});
  
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
          showModalBottomSheet(
            context: context, 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            builder: (context) => Container(
              padding: const EdgeInsets.all(defaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Make Selection", style: Theme.of(context).textTheme.headlineMedium),
                  Text("Select one of the options given below to reset password", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.to(() => const VerifyEmail()),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.mail_outline_rounded, size: 60),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email", style: Theme.of(context).textTheme.headlineSmall),
                              Text("Reset via email verification", style: Theme.of(context).textTheme.bodySmall),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => Get.to(() => const VerifyPhone()),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.mail_outline_rounded, size: 60),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone number", style: Theme.of(context).textTheme.headlineSmall),
                              Text("Reset via SMS verification", style: Theme.of(context).textTheme.bodySmall),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  
                ],
              ),
          ));
        }, 
        child: const Text("Forgot password?"));

  } 
}