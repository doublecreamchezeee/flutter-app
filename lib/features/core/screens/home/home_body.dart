// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
// import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/core/animation/fadeanimation.dart';
import 'package:flutter_application_1/features/core/api/api.dart';
import 'package:flutter_application_1/features/core/screens/detail/detail_screen.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../../animation/fadeanimation.dart';
// import '../../../../utils/constants.dart';
import '../../models/shoe_model.dart';
import '../../models/categories_model.dart';
// import '../../../../view/detail/detail_screen.dart';
import '../../data/dummy_data.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;
  List<ShoeModel> shoeList = [];
  List<CategoriesModel> categoriesList = [];
  @override
  void initState() {
    super.initState();
    fetchShoeList();
    fetchCategoriesList();
  }
  Future<void> fetchCategoriesList() async {
    final response = await ApiService.getCategories();
    setState(() {
      categoriesList = response!;
    });
  }
  Future<void> fetchShoeList() async {
    final response = await ApiService.getProducts();
    setState(() {
      shoeList = response!;
      // print(shoeList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        topCategoriesWidget(width, height),
        SizedBox(height: 10),
        middleCategoriesWidget(width, height),
        SizedBox(height: 5),
        moreTextWidget(),
        lastCategoriesWidget(width, height),
      ],
    );
  }

// Top Categories Widget Components
  topCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: width,
          height: height / 18,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: categoriesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () async {
                    // print(categoriesList[index].name);
                    final response = await ApiService.getProductsWithCategory(categoriesList[index].id);
                    setState(() {
                      selectedIndexOfCategory = index;
                      shoeList = response!;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      categoriesList[index].name,
                      style: TextStyle(
                          fontSize: selectedIndexOfCategory == index ? 20 : 16,
                          color: selectedIndexOfCategory == index
                              ? Color.fromARGB(255, 0, 0, 0)
                              : Color.fromARGB(218, 167, 167, 167),
                          fontWeight: selectedIndexOfCategory == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          fontFamily: GoogleFonts.montserrat().fontFamily
                          ),
                          
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

// Middle Categories Widget Components
  middleCategoriesWidget(width, height) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: width / 16,
          height: height / 3,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: featured.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndexOfFeatured = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        featured[index],
                        style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontSize:
                                selectedIndexOfFeatured == index ? 16 : 13,
                            color: selectedIndexOfFeatured == index
                                ? Color.fromARGB(255, 0, 0, 0)
                                : Color.fromARGB(202, 167, 167, 167),
                            fontWeight: selectedIndexOfFeatured == index
                                ? FontWeight.bold
                                : FontWeight.w400),
                      ),
                    ),
                  );
                }),
          ),
        ),
        Container(
          width: width / 1.2,
          height: height / 2.5,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: shoeList.length,
            itemBuilder: (ctx, index) {
              ShoeModel model = shoeList[index];
              CategoriesModel cate = categoriesList[selectedIndexOfCategory];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                        model: model,
                        isComeFromMoreSection: false,
                        category: cate
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: width / 1.81,
                        decoration: BoxDecoration(
                          color: shoeList[index].modelColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              BoxText.headingSmall(categoriesList[selectedIndexOfCategory].name, color: AppColor.textCardHomeBarColor),
                              SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 10,
                        child: FadeAnimation(
                          delay: 1.5,
                          child: BoxText.subheading(model.model, color: AppColor.textCardHomeBarColor)
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 10,
                        child: FadeAnimation(
                          delay: 2,
                          child: BoxText.body("\$${model.price.toStringAsFixed(2)}", color: AppColor.textCardHomeBarColor),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 60,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.imgAddress,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-30 / 360),
                              child: Container(
                                width: 250,
                                height: 230,
                                child: Image(
                                  image: AssetImage(model.imgAddress),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 170,
                        child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.circleArrowRight,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

// More Text Widget Components
  moreTextWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          BoxText.headingMedium("More"),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                CupertinoIcons.arrow_right,
                size: 27,
              ))
        ],
      ),
    );
  }

// Last Categories Widget Components
  lastCategoriesWidget(width, height) {
    return Container(
      width: width,
      height: height / 4,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: shoeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            ShoeModel model = shoeList[index];
            CategoriesModel cate = categoriesList[selectedIndexOfCategory];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                      model: model,
                      isComeFromMoreSection: true,
                      category: cate,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: width / 2.24,
                height: height / 4.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 5,
                      child: FadeAnimation(
                        delay: 1,
                        child: Container(
                          width: width / 13,
                          height: height / 10,
                          color: Colors.red,
                          child: RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                  child: FadeAnimation(
                                delay: 1.5,
                                child: BoxText.headingMedium("NEW"),
                              ))),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: AppColor.primaryColorDark,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 25,
                      child: FadeAnimation(
                        delay: 1.5,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(-15 / 360),
                          child: Container(
                            width: width / 3,
                            height: height / 9,
                            child: Hero(
                              tag: model.model,
                              child: Image(
                                image: AssetImage(model.imgAddress),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 124,
                      left: 45,
                      child: FadeAnimation(
                        delay: 2,
                        child: Container(
                          width: width / 4,
                          height: height / 42,
                          child: FittedBox(
                            child: BoxText.headingSmall("${model.brand} ${model.model}")
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 45,
                      child: FadeAnimation(
                        delay: 2.2,
                        child: Container(
                          width: width / 4,
                          height: height / 42,
                          child: FittedBox(
                            child: BoxText.body("\$${model.price.toStringAsFixed(2)}")
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}