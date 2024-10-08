import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_footer.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_form.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_header.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            children: [
              RegisterHeader(),
              SizedBox(height: 10),
              RegisterForm(),
              RegisterFooter(),
            ],
          ),
        ),
      )
    );
  }
}