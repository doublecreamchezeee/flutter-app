import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_footer.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_form.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_header.dart';
// import 'package:get/get.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            children: [
              LoginHeader(),
              SizedBox(height: 20),
              LoginForm(),
              LoginFooter(),
            ],
          ),
        ),
      )
    );
  }
}