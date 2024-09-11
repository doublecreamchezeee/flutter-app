// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/core/animation/fadeanimation.dart';
import 'package:flutter_application_1/utils/styles/box_text.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              delay: 0.5,
              child:
                  BoxText.caption("No shoes added!"),
            ),
            FadeAnimation(
              delay: 0.5,
              child: BoxText.caption("Once you have added, come back"),
            ),
          ],
        ),
      ),
    );
  }
}