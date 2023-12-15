import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/shadow/custom_shadow.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class CardDecoration extends BoxDecoration {
  CardDecoration({
    Key? key,
  }) : super(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          boxShadow: <BoxShadow>[CustomShadow()],
        );
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.image,
    this.rating,
    this.children = const <Widget>[],
    this.text,
  }) : super(key: key);

  final String? image;
  final String? text;
  final double? rating;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 1.sw,
      decoration: CardDecoration(),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          children: <Widget>[
            if (image != null) ...[
              DefaultCircleAvatar(image!),
              SizedBox(width: 10.w),
            ],
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children ?? [],
              ),
            ),
            if (rating != null) ...[SizedBox(width: 10.w), Points(rating: rating, text: text)]
          ],
        ),
      ),
    );
  }
}

class Points extends StatelessWidget {
  const Points({
    Key? key,
    required this.rating,
    required this.text,
  }) : super(key: key);

  final double? rating;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.r,
      height: 65.r,
      decoration: BoxDecoration(
        color: AppColor.light[800],
        borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomTextBold("$rating", fontSize: 18.sp),
          if (text != null) ...[
            CustomTextMedium(
              text!,
              fontSize: 7.sp,
              textHeight: 2,
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
    );
  }
}
