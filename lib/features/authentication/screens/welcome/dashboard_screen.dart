import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/screens/logout/logout.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Dashboard"),
          SizedBox(height: 30),
          Logout()
        ],
      )
    );
  }
}
