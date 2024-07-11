import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget{
  const LoginFooter({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => {}, 
          child: const Text.rich(
            TextSpan(
              text: "Dont have account? ",
              children: [
                TextSpan(
                  text: "Sign up",
                )
              ]
            )
          ), 
          
        ),
      ],
    );
  }
}