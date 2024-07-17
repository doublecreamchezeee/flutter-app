import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/ui.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(tWelcomeScreenImage),
              height: height * 0.4,
            ),
            const Column(
              children: [
                BoxText.headingLarge(tWelcomeTittle),
                BoxText.subheading(tWelcomeSubTitle),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20.0),
                Expanded(
                  child: BoxButton.outline(
                    title: tLogin,
                    onTap: () => Get.to(() => const LoginScreen()),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: BoxButton(
                    title: tRegister,
                    onTap: () => Get.to(() => const RegisterScreen()),
                  ),
                ),
                const SizedBox(width: 20.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
