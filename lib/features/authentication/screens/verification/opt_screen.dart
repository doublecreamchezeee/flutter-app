import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_application_1/constants/sizes.dart';


class OptScreen extends StatelessWidget{
  const OptScreen(this.email);

  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text("CO", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 10),
            Text("DE", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 15),
            Text("Verification", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 15),
            Text("Enter the verification code sent on your personal information $email", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            OtpTextField(
              numberOfFields: 6,
              borderColor: const Color.fromARGB(255, 156, 128, 221),
              showFieldAsBox: true,
              onCodeChanged: (String code){
        
              },
              onSubmit: (String verificationCode){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}