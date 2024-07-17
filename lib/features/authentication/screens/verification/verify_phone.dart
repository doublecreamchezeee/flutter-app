import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/features/authentication/screens/verification/otp_screen.dart';

class VerifyPhone extends StatefulWidget{
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerfyPhoneState();
}

class _VerfyPhoneState extends State<VerifyPhone>{
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
        title: const BoxText.headingSmall(tAppBarVerifyPhone),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
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