import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// `CustomTextSemiBold` is a custom text widget that uses the `Roboto` font family with a `w600` font
/// weight
class CustomTextSemiBold extends StatelessWidget {
  const CustomTextSemiBold(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.decoration,
    this.textAlign,
    this.textHeight,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 14.sp,
        fontWeight: FontWeight.w600,
        fontStyle: fontStyle,
        decoration: decoration,
      ),
      textAlign: textAlign,
    );
  }
}

/// `CustomTextBold` is a `StatelessWidget` that displays a `Text` widget with a bold font style
class CustomTextBold extends StatelessWidget {
  const CustomTextBold(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.decoration,
    this.textAlign,
    this.textHeight,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 14.sp,
        fontWeight: FontWeight.bold,
        fontStyle: fontStyle,
        decoration: decoration,
      ).copyWith(height: textHeight),
      textAlign: textAlign,
    );
  }
}

class CustomTextLight extends StatelessWidget {
  const CustomTextLight(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.decoration,
    this.textAlign,
    this.textHeight,
    this.overflow,
    this.maxLinex,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final double? textHeight;
  final bool? overflow;
  final int? maxLinex;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 14.sp,
        fontWeight: FontWeight.w300,
        fontStyle: fontStyle,
        decoration: decoration,
        overflow: overflow ?? false ? TextOverflow.ellipsis : null,
      ).copyWith(height: textHeight),
      maxLines: maxLinex,
      textAlign: textAlign,
    );
  }
}

/// `CustomTextMedium` is a custom text widget that takes in a `String` and returns a `Text` widget with
/// a medium font size
class CustomTextMedium extends StatelessWidget {
  const CustomTextMedium(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.decoration,
    this.textAlign,
    this.textHeight,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 14.sp,
        fontWeight: FontWeight.w400,
        fontStyle: fontStyle,
        decoration: decoration,
      ).copyWith(height: textHeight),
      textAlign: textAlign,
    );
  }
}

/// A custom text widget that takes in a string and returns a black text widget with a font size of
/// 14sp.
class CustomTextBlack extends StatelessWidget {
  const CustomTextBlack(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontStyle,
    this.decoration,
    this.textAlign,
    this.textHeight,
  }) : super(key: key);

  final String text;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 14.sp,
        fontWeight: FontWeight.w900,
        fontStyle: fontStyle,
        decoration: decoration,
      ).copyWith(height: textHeight),
      textAlign: textAlign,
    );
  }
}
