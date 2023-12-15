import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class DarkenImage extends StatelessWidget {
  const DarkenImage({
    super.key,
    required this.url,
    required this.name,
  });

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.darken),
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: CustomTextBlack(
            name,
            color: Colors.white,
            fontSize: 13.sp,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
