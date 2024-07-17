import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/authentication/screens/verification/verify_email.dart';
import 'package:flutter_application_1/features/authentication/screens/verification/verify_phone.dart';
import 'package:flutter_application_1/ui.dart';
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
                  // Text("Make Selection", style: Theme.of(context).textTheme.headlineMedium),
                  // Text("Select one of the options given below to reset password", style: Theme.of(context).textTheme.bodyMedium),
                  const BoxText.headingMedium(tMakeSelection),
                  const BoxText.caption(tMakeSelectionCaption),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.to(() => const VerifyEmail()),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.mail_outline_rounded, size: 50),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoxText.headingSmall(tEmail),
                              BoxText.caption(tResetByEmail),
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
                      child: const Row(
                        children: [
                          Icon(Icons.phone_outlined, size: 50),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoxText.headingSmall(tPhone),
                              BoxText.caption(tResetByPhone),
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
        child: const BoxText.caption(tForgotPass));

  } 
}