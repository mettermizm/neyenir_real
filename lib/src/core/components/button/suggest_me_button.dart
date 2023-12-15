import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/constants/svg_constants.dart';

class SuggestMeButton extends StatelessWidget {
  const SuggestMeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: .05.sh, vertical: .015.sh),
      decoration: const BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              SVGConstants.sparkle,
              width: .05.sw,
              color: Colors.white,
            ),
            SizedBox(width: .025.sw),
            CustomTextMedium(
              'Bana bi\'şeyler öner!',
              fontSize: 14.sp,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
