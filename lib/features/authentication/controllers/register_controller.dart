import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
    static RegisterController get instance => Get.find();

    final email = TextEditingController();
    final password = TextEditingController();
    final fullName = TextEditingController();
    final phone = TextEditingController();

    void registerUser(String email, String password){
      AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    }
}