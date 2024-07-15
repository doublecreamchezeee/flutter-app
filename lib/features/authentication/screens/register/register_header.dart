import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';

class RegisterHeader extends StatelessWidget{
  const RegisterHeader({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      
    return Column(
      children: [
        Image(image: const AssetImage(welcomeScreenImage), height: size.height * 0.2, ),
        Text("Sign Up", style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}