import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

PreferredSize? customAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(70),
    child: AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(213, 255, 255, 255),
      title: const Padding(
        padding: EdgeInsets.only(top: 18.0, left: 15.0),
        child: BoxText.headingMedium("Discover"),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            onPressed: () {}, 
            icon: const FaIcon(
              CupertinoIcons.search,
              size: 25,
            ),
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 4),
          child: IconButton(
            icon: const FaIcon(
              CupertinoIcons.bell,
              size: 25,
            ),
            onPressed: () {},
          )
        )
      ],
    ),
    
  );
}