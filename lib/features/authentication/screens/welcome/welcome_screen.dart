import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_screen.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: const AssetImage(welcomeScreenImage),
            height: height * 0.6,
          ),
          Column(
            children: [
              Text(welcomeTittle,
                  style: Theme.of(context).textTheme.headlineLarge),
              Text(welcomeSubTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                  child: OutlinedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                child: const Text(login),
              )),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () => Get.to(() => const RegisterScreen()),
                child: const Text(register),
              )),
              const SizedBox(
                width: 20.0,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
