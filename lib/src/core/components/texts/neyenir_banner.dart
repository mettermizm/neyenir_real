import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neyenir_app/src/core/components/texts/around_neyenir.dart';
import 'package:neyenir_app/src/core/components/texts/suggest_me.dart';
import 'package:neyenir_app/src/core/constants/svg_constants.dart';

/// It's a row with a widget on the left, a flexible widget in the middle, and a widget on the right
class NeyenirBanner extends StatelessWidget {
  const NeyenirBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AroundNeyenir(),
        Flexible(child: Container()),
        SvgPicture.asset(SVGConstants.sparkle, width: .05.sw),
        SizedBox(width: .025.sw),
        const SuggestMe(),
      ],
    );
  }
}
