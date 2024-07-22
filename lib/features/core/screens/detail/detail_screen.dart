import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/core/models/shoe_model.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  DetailScreen({super.key, required this.model,required this.isComeFromMoreSection});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Color.fromARGB(255, 255, 152, 152),
          // appBar: customAppBarDe(
          //   context,
          // ),
          // body: DetailsBody(
          //   model: model,
          //   isComeFromMoreSection: isComeFromMoreSection,
          // )),
    ));
  }
}