// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/constants/api.dart';
import 'package:flutter_application_1/exceptions/login_failure.dart';
import 'package:flutter_application_1/exceptions/register_email_password_failure.dart';
import 'package:flutter_application_1/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_application_1/features/authentication/screens/register/register_screen.dart';
import 'package:flutter_application_1/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter_application_1/features/core/screens/navigator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // final _auth = FirebaseAuth.instance;
  // late final Rx<User?> firebaseUser; 

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const MainNavigator());
  }

  Future<void> signUp(String username, String password, String city, 
    String firstName, String lastName, String dob ) async {
    try {
      var uri = Uri.parse(authUrl + signUpEndpoint);
      var res = await http.post(
        uri, 
        headers: {
          "Content-Type": "application/json"
        },
        body: json.encode({
          "username": username,
          "password": password,
          "dob": dob,
          "city": city,
          "firstName": firstName,
          "lastName": lastName,
        })
      );
      if (res.statusCode == 200) {
        Get.offAll(() => const LoginScreen());
      } else { 
        Get.to(() => const RegisterScreen());
      }
    } 
    catch (_){
      const ex = RegisterEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }
  
  Future<void> signIn(String username, String password) async {
    try {
      var uri = Uri.parse(authUrl + loginEndpoint);
      var res = await http.post(
        uri, 
        headers: {
          "Content-Type": "application/json"
        },
        body: json.encode({
          "username": username,
          "password": password
        })
      );
      
      if (res.statusCode == 200) {
        Get.offAll(() => const MainNavigator());
        var tokenData = json.decode(res.body)['result']['token'];
        storage.write(key: "jwt", value: tokenData);
      } else { 
        Get.to(() => const LoginScreen());
      }
    } 
    catch (_){
      const ex = LoginFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async {
    try {
      storage.write(key: "jwt", value: '');
      Get.to(() => const WelcomeScreen());
    }
    catch (_){
      const ex = LoginFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> saveToken(String token) async {
    await storage.write(key: 'jwt', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'jwt');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'jwt');
  }

  Future<bool?> checkTokenValidation(String token) async{
    try {
      var uri = Uri.parse(authUrl + introspectEndpoint);
      var res = await http.post(
        uri, 
        headers: {
          "Content-Type": "application/json"
        },
        body: json.encode({
          "token": token,
        })
      );
      
      if (res.statusCode == 200){
        var validToken = json.decode(res.body)['result']['valid'];
        return validToken;
      }
      return false;
    } catch (_){
      print(_);
      return false;
    }
  }

  Future<bool?> refreshToken(String oldToken) async {
    try {
      var uri = Uri.parse(authUrl + refreshEndpoint);
      var res = await http.post(
        uri, 
        headers: {
          "Content-Type": "application/json"
        },
        body: json.encode({
          "token": oldToken,
        })
      );
      
      if (res.statusCode == 200){
        var refreshToken = json.decode(res.body)['result']['token'];
        storage.write(key: "jwt", value: refreshToken);
        return true;
      }

      return false;
    } catch (_){
      print(_);
      return false;
    }
  }
}