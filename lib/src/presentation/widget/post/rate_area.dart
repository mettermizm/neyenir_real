import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/presentation/widget/post/rating_bar.dart';

class RateArea extends StatelessWidget {
  const RateArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: const [
              RatingBar(title: 'Lezzet', score: 4),
              RatingBar(title: 'Isı', score: 4),
              RatingBar(title: 'Posiyon Büyüklüğü', score: 4),
              RatingBar(title: 'Servis', score: 3),
              RatingBar(title: 'Sunum', score: 5),
              RatingBar(title: 'Fiyat', score: 5),
              RatingBar(title: 'Mekan Müşteri Kitlesi', score: 5),
            ],
          ),
        ),
        SizedBox(width: 0.0325.sw),
        SizedBox(
          width: 0.2.sw,
          child: Column(
            children: [
              const CustomTextBold('5'),
              CustomTextMedium('Ürün Puanı', fontSize: 8.sp),
              Divider(color: AppColor.dark, height: 10.h, thickness: 1),
              const CustomTextBold('4'),
              CustomTextMedium('Mekan Puanı', fontSize: 8.sp),
            ],
          ),
        )
      ],
    );
  }
}
