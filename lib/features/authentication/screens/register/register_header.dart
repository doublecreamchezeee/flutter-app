import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/ui.dart';

class RegisterHeader extends StatelessWidget{
  const RegisterHeader({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      
    return Column(
      children: [
        Image(image: const AssetImage(tSignupHeaderImage), height: size.height * 0.25, ),
        const BoxText.headingMedium(tSignupBtn)
      ],
    );
  }
}