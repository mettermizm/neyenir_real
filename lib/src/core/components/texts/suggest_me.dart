import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

/// It's a stateless widget that has a GestureDetector that pushes a route when tapped
class SuggestMe extends StatelessWidget {
  const SuggestMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => router.push(const SuggestRouter()),
      child: CustomTextMedium(
        'Bana bi\'şeyler öner!',
        fontSize: 13.sp,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
