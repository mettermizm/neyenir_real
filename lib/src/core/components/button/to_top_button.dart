import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class ToTopButton extends StatelessWidget {
  const ToTopButton({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return PagePadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextMedium('Başa Dön', fontSize: 10.sp),
          SizedBox(width: .025.sw),
          Container(
            width: .1.sw,
            height: .1.sw,
            decoration: const BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            child: IconButton(
              onPressed: () {
                scrollController.animateTo(0,
                    duration: const Duration(seconds: 1), curve: Curves.easeIn);
              },
              icon: const Icon(Icons.keyboard_arrow_up, color: AppColor.light),
            ),
          ),
        ],
      ),
    );
  }
}
