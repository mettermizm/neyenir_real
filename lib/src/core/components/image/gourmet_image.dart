import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class GourmetImage extends StatelessWidget {
  const GourmetImage({
    super.key,
    required this.url,
    required this.name,
  });

  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: .6.sw,
          width: .4.sw,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: .6.sw,
          width: .4.sw,
          child: const DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [Colors.transparent, Colors.black],
                stops: [.8, 1.0],
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: .025.sw,
          child: CustomTextSemiBold(
            name,
            color: Colors.white,
            fontSize: 14.sp,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
