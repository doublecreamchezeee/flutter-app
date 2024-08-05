import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
    static RegisterController get instance => Get.find();

    final username = TextEditingController();
    final password = TextEditingController();
    final firstName = TextEditingController();
    final lastName = TextEditingController();
    final dateDob = TextEditingController();
    final monthDob = TextEditingController();
    final yearDob = TextEditingController();
    final city = TextEditingController();
    void registerUser(String username, String password, String firstName,
    String lastName, String dateDob, String monthDob, String yearDob, String city){
      String dob = "$yearDob-$monthDob-$dateDob";
      AuthenticationRepository.instance.signUp(username, password, city, firstName, lastName, dob);
    }
}