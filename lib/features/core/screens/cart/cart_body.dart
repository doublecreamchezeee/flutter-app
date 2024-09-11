// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/core/animation/fadeanimation.dart';
import 'package:flutter_application_1/features/core/data/dummy_data.dart';
import 'package:flutter_application_1/features/core/models/shoe_model.dart';
import 'package:flutter_application_1/features/core/screens/cart/empty_list.dart';
import 'package:flutter_application_1/utils/styles/box_text.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody>
    with SingleTickerProviderStateMixin {
  int lengthsOfItemsOnBag = itemsOnBag.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      width: width,
      height: height,
      child: Column(
        children: [
          topText(width, height),
          Divider(
            color: Colors.grey,
          ),
          itemsOnBag.isEmpty
              ? EmptyList()
              : Column(children: [
                  mainListView(width, height),
                  SizedBox(
                    height: 12,
                  ),
                  bottomInfo(width, height),
                ])
        ],
      ),
    );
  }

  // Top Texts Components
  topText(width, height) {
    return Container(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 0,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BoxText.body("My Cart"),
              BoxText.caption("Total ${lengthsOfItemsOnBag} Items"),
            ],
          ),
        ),
      ),
    );
  }

  // Material Button Components
  materialButton(width, height) {
    return FadeAnimation(
      delay: 3,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 17,
        // color: AppConstantsColor.materialButtonColor,
        onPressed: () {},
        child: BoxText.headingSmall("NEXT"),
      ),
    );
  }

  // Main ListView Components
  mainListView(width, height) {
    return Container(
      width: width,
      height: height / 1.8,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: itemsOnBag.length,
          itemBuilder: (ctx, index) {
            ShoeModel currentBagItem = itemsOnBag[index];

            return FadeAnimation(
              delay: 1.5 * index / 4,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 1),
                width: width,
                height: height / 5.2,
                child: Row(
                  children: [
                    Container(
                      width: width / 2.8,
                      height: height / 5.7,
                      child: Stack(children: [
                        Positioned(
                          top: 20,
                          left: 10,
                          child: Container(
                            width: width / 3.6,
                            height: height / 7.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              // color: Colors.grey[350],
                              color: currentBagItem.modelColor,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 2,
                            bottom: 15,
                            child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-40 / 360),
                              child: Container(
                                width: 140,
                                height: 140,
                                child: Image(
                                  image: AssetImage(
                                    currentBagItem.imgAddress,
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoxText.headingSmall(currentBagItem.model),
                          SizedBox(
                            height: 4,
                          ),
                          BoxText.caption("\$${currentBagItem.price}"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    itemsOnBag.remove(currentBagItem);
                                    lengthsOfItemsOnBag = itemsOnBag.length;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 15,
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              BoxText.caption("1"),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[300],
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    size: 15,
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  bottomInfo(width, height) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: width,
      height: height / 7,
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoxText.caption("TOTAL"),
                BoxText.body("\$10"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          materialButton(width, height)
        ],
      ),
    );
  }
}