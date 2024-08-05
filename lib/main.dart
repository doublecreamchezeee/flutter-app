import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter_application_1/features/core/screens/navigator.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';
import 'package:get/get.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationRepository());
  final authInstance = AuthenticationRepository.instance;
  final token = await authInstance.getToken();
  bool? isTokenValid = await authInstance.checkTokenValidation(token!);
  
  if (!isTokenValid!){
    isTokenValid = await authInstance.refreshToken(token);
  }
  runApp(MyApp(isTokenValid: isTokenValid!));
}

class MyApp extends StatelessWidget {
  final bool isTokenValid;
  const MyApp({super.key, required this.isTokenValid});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: isTokenValid ? const MainNavigator() : const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
