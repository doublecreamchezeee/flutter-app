import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController{
    static LogoutController get instance => Get.find();

    void logoutUser(){
      AuthenticationRepository.instance.logout();
    }
}