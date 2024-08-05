// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_key_in_widget_constructors

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/welcome/welcome_screen.dart';
// import 'package:sneakers_app/view/bag/bag_screen.dart';
import "package:flutter_application_1/features/core/screens/home/home_screen.dart";
import 'package:flutter_application_1/features/core/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';
import 'package:get/get.dart';
// import 'package:sneakers_app/view/profile/profile_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  PageController _pageController = PageController();

  int _selectedIndex = 0;
  List<Widget> _screen = [
    HomeScreen(),
    // MyBagScreen(),
    ProfileScreen(),
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    final authInstance = AuthenticationRepository.instance;
    String? token = await authInstance.getToken();
    bool? isTokenValid = await authInstance.checkTokenValidation(token!);
    print('check token: $isTokenValid');
    print('token: $token');
    if (!isTokenValid!) {
      var refreshResult = await authInstance.refreshToken(token);
      if (!refreshResult!) {
        // Nếu không thể làm mới token, điều hướng về WelcomeScreen
        Get.offAll(() => WelcomeScreen());
      } else {
        // Kiểm tra lại token sau khi làm mới
        token = await authInstance.getToken();
        isTokenValid = await authInstance.checkTokenValidation(token!);
        if (!isTokenValid!) {
          Get.offAll(() => WelcomeScreen());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: _screen,
      ),
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 25.0,
        bubbleCurve: Curves.linear,
        selectedColor: AppColor.primaryColorDark,
        strokeColor: AppColor.buttonOutlineLight,
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          // CustomNavigationBarItem(
          //   icon: Icon(CupertinoIcons.shopping_cart),
          // ),
          CustomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}