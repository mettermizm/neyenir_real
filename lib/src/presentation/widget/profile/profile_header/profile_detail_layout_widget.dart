import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/image_source.dart';

class ProfileDetailLayoutWidget extends StatelessWidget {
  const ProfileDetailLayoutWidget({
    Key? key,
    required this.image,
    this.rating,
    this.subText = const <Widget>[],
    this.trailingTitle,
  }) : super(key: key);

  final String image;
  final String? trailingTitle;
  final double? rating;
  final List<Widget>? subText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DefaultCircleAvatar(
          image,
          source: ImageSource.asset,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subText ?? [],
          ),
        ),
        if (rating != null) ...[
          SizedBox(width: 10.w),
          Container(
            width: 65.r,
            height: 65.r,
            decoration: BoxDecoration(
              color: AppColor.light[800],
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextBold('$rating', fontSize: 18.sp),
                if (trailingTitle != null) ...[
                  CustomTextMedium(
                    trailingTitle!,
                    fontSize: 7.sp,
                    textHeight: 1.1,
                    textAlign: TextAlign.center,
                  )
                ]
              ],
            ),
          )
        ],
      ],
    );
  }
}
