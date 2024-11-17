import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_colors.dart';

class CommonText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;
  const CommonText({
    super.key,
    this.text,
    this.maxLines,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.textDecoration,
    this.overflow,
    this.letterSpacing,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: maxLines,
      style: TextStyle(
          color: color ?? AppColor.black,
          decoration: textDecoration ?? TextDecoration.none,
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal,
          overflow: overflow,
          letterSpacing: letterSpacing,
          height: height),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
