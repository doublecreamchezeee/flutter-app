import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/ui.dart';

class LoginHeader extends StatelessWidget{
  const LoginHeader({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      
    return Column(
      children: [
        Image(image: const AssetImage(tLoginHeaderImage), height: size.height * 0.3),
        const BoxText.headingMedium(tLogin)
      ],
    );
  }
}