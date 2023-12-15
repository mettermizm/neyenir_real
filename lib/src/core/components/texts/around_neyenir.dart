import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/constants/svg_constants.dart';

/// It's a column with a text and an image
class AroundNeyenir extends StatelessWidget {
  const AroundNeyenir({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextLight('Bu civarda', fontSize: 18.sp),
        SvgPicture.asset(SVGConstants.neyenir),
      ],
    );
  }
}
