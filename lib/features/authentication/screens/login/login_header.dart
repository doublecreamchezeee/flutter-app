import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';

class LoginHeader extends StatelessWidget{
  const LoginHeader({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      
    return Column(
      children: [
        Image(image: const AssetImage(welcomeScreenImage), height: size.height * 0.2, ),
        Text("Login", style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}