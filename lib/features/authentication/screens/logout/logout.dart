import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/logout_controller.dart';
import 'package:get/get.dart';

class Logout extends StatelessWidget {
  const Logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogoutController());
    return SizedBox(
      height: 30,
      width: 30,
      child: ElevatedButton(
        onPressed: () {
          controller.logoutUser();
        }, 
        child: const Text("Log out")
      ),
    );
  }
}
