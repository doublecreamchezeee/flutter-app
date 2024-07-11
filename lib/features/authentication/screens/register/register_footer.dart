import 'package:flutter/material.dart';

class RegisterFooter extends StatelessWidget{
  const RegisterFooter({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => {}, 
          child: const Text.rich(
            TextSpan(
              text: "Already have an account? ",
              children: [
                TextSpan(
                  text: "Sign in",
                )
              ]
            )
          ), 
          
        ),
      ],
    );
  }
}