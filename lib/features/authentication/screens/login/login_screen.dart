import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/constants/string.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            children: [
              Image(image: const AssetImage(welcomeScreenImage)),
              Text(login, style: Theme.of(context).textTheme.headlineMedium),
              Text(register, style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
      )
    );
  }
}