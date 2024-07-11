import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_footer.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_form.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_header.dart';
// import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: const Column(
            children: [
              RegisterHeader(),
              SizedBox(height: 20),
              RegisterForm(),
              LoginFooter(),
            ],
          ),
        ),
      )
    );
  }
}