import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/authentication/screens/verification/otp_screen.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatefulWidget{
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(  // Added Scaffold here
      appBar: AppBar(
        title: const BoxText.headingSmall(tAppBarVerifyEmail),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  BoxInputField(
                    controller: controller,
                    leading: const Icon(Icons.email),
                    placeholder: 'Enter Email',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: BoxButton(
                title: tConfirm,
                onTap: () => Get.to(() => OptScreen(controller.text)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}