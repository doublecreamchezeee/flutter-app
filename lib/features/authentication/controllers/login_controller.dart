import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
    static LoginController get instance => Get.find();

    final email = TextEditingController();
    final password = TextEditingController();

    void loginUser(String email, String password){
      AuthenticationRepository.instance.signInWithEmailAndPassword(email, password);
    }
}