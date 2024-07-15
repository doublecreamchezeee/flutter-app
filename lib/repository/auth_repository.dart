import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/exceptions/register_email_password_failure.dart';
import 'package:flutter_application_1/features/authentication/screens/welcome/dashboard_screen.dart';
import 'package:flutter_application_1/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser; 

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => const DashboardScreen());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const DashboardScreen()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch(e){
      final ex = RegisterEmailPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } 
    catch (_){
      const ex = RegisterEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){} 
    catch (_){}
  }
  Future<void> logout() async => await _auth.signOut();
}