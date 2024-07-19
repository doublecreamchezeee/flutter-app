import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;

  const BoxText.headingLarge(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.headingLargeStyle;

  const BoxText.headingMedium(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.headingMediumStyle;

  const BoxText.headingSmall(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.headingSmallStyle;

  const BoxText.headline(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.headlineStyle;

  const BoxText.subheading(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.subheadingStyle;

  const BoxText.caption(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.captionStyle;

  const BoxText.buttonText(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.buttonStyle;

  const BoxText.body(
    this.text, {
    super.key,
    this.color = const Color.fromARGB(225, 225, 225,225),
  }) : style = AppText.bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat().merge(style.copyWith(color: color)),
    );
  }
}
