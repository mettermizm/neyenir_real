import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

/// It's a floating action button that opens the rating page
class RateFAB extends StatelessWidget {
  const RateFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      width: .2.sw,
      height: .2.sw,
      child: FloatingActionButton(
        backgroundColor: AppColor.primary,
        onPressed: () => router.push(const RatingRouter()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: AppColor.light,
              size: .085.sw,
            ),
            SizedBox(height: .0075.sw),
            CustomTextSemiBold(
              'PUANLA',
              fontSize: 8.sp,
              color: AppColor.light,
            ),
            SizedBox(height: .015.sw),
          ],
        ),
      ),
    );
  }
}
