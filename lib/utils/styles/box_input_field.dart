import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';

class BoxInputField extends StatelessWidget{
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final bool password;
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  );

  BoxInputField({
    super.key,
    required this.controller,
    this.placeholder = "",
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppText.buttonStyle,
      obscureText: password,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        prefixIcon: leading,
        suffixIcon: trailing != null ? GestureDetector(onTap: trailingTapped, child: trailing,) : null,
        border: circularBorder.copyWith(
          borderSide: const BorderSide(color: Color.fromARGB(255, 197, 197, 197))
        ),
        errorBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: Color.fromARGB(255, 253, 82, 82))
        ),
        focusedBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: Color.fromARGB(255, 151, 248, 122))
        ),
        enabledBorder: circularBorder.copyWith(
          borderSide: const BorderSide(color: Color.fromARGB(255, 197, 197, 197))
        ),
      ),

    );
  }

}