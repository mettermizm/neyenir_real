import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/constants/application_constants.dart';

class StoreText extends StatelessWidget {
  const StoreText({Key? key, required this.style, required this.adress}) : super(key: key);

  final String style;
  final String adress;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: style,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
          fontFamily: ApplicationConstants.fontFamily,
          fontSize: 8.sp,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' - $adress',
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
