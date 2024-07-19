import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/core/screens/home/home_bar.dart';
import 'package:flutter_application_1/features/core/screens/home/home_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(),    
        body: const HomeBody(),
      )
    );
  }
}
