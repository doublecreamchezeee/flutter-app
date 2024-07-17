import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_application_1/constants/sizes.dart';


class OptScreen extends StatelessWidget{
  const OptScreen(this.info, {super.key});

  final String info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingSmall(tAppBarVerifyOtp),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          children: [
            const Image(image: AssetImage(tOtpHeaderImage)),
            const SizedBox(height: 20),
            const BoxText.headingMedium(tVerification),
            const SizedBox(height: 15),
            BoxText.body(tVerificationCaption + info),
            const SizedBox(height: 10),
            OtpTextField(
              numberOfFields: 6,
              borderColor: const Color.fromARGB(255, 156, 128, 221),
              showFieldAsBox: true,
              onCodeChanged: (String code){
        
              },
              onSubmit: (String verificationCode){
              },
            )
          ],
        ),
      ),
    );
  }
}