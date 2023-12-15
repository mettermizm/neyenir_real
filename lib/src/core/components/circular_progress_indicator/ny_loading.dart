import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neyenir_app/src/core/components/circular_progress_indicator/custom_circular_progress_indicator.dart';
import 'package:neyenir_app/src/core/constants/svg_constants.dart';

/// `NYLoading` is a `StatelessWidget` that displays a `CustomCircularProgressIndicator` and an
/// `SvgPicture` of the NY logo
class NYLoading extends StatelessWidget {
  const NYLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: .125.sh,
            height: .125.sh,
            child: const CustomCircularProgressIndicator(),
          ),
          SvgPicture.asset(
            SVGConstants.nyLogo,
            width: .05.sh,
          ),
        ],
      ),
    );
  }
}
