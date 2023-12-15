import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/percent_indicator/linear_percent.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key? key,
    required this.title,
    required this.score,
    this.limit,
  }) : super(key: key);

  final String title;
  final double score;
  final int? limit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: <Widget>[
          Expanded(child: CustomTextMedium(title, fontSize: 8.sp)),
          Expanded(child: linearPercentage(context)),
          SizedBox(width: 7.w),
          CustomTextMedium('${score.floor()}', fontSize: 8.sp),
        ],
      ),
    );
  }

  Widget linearPercentage(BuildContext context) {
    return Row(
      children: <Widget>[
        LinearPercent(
          score: score,
          limit: limit,
          borderHeight: 5.h,
          decoration: BoxDecoration(color: AppColor.light[900]),
          foregroundDecoration: const BoxDecoration(color: AppColor.dark),
        ),
      ],
    );
  }
}
