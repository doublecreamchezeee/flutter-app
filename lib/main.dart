import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';
import 'package:get/get.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const WelcomeScreen(),
    );
  }
}
