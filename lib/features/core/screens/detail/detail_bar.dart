import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/core/models/categories_model.dart';
import 'package:flutter_application_1/ui.dart';

PreferredSize? customDetailAppBar(ctx, CategoriesModel category){
  return PreferredSize(
    preferredSize: const Size.fromHeight(50), 
    child: AppBar(
      // leadingWidth: 0,
      // leading: const SizedBox.shrink(),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 15.0),
        child: BoxText.headline(category.name, color: Colors.white,),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(ctx);
        },
        icon: const Icon(
          Icons.arrow_back,
          // color: Colors.grey,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ],
    )
  );
}