import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/core/models/categories_model.dart';
import 'package:flutter_application_1/features/core/models/shoe_model.dart';
import 'package:flutter_application_1/features/core/screens/detail/detail_bar.dart';
import 'package:flutter_application_1/features/core/screens/detail/detail_body.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  ShoeModel model;
  bool isComeFromMoreSection;
  CategoriesModel category;
  DetailScreen({super.key, required this.model,required this.isComeFromMoreSection, required this.category});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: customDetailAppBar(
          context,
          category
        ),
        body: DetailsBody(
          model: model,
          isComeFromMoreSection: isComeFromMoreSection,
        )
      ),
    );
  }
}