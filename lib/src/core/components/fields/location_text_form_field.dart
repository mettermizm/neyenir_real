import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/icon/app_icon.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/fields/default_text_form_field.dart';
import 'package:neyenir_app/src/core/components/search/search_delegate.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/presentation/view/search_view.dart';

/// `LocationTextFormField` is a `StatelessWidget` that displays a `DefaultTextFormField` with a
/// `LocationText` and `LocationIcon` as a suffix
class LocationTextFormField extends StatelessWidget {
  const LocationTextFormField({
    Key? key,
    this.withButton = false,
  }) : super(key: key);

  final bool withButton;

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      title: 'Yemek, mekan veya kişi ara...',
      controller: null,
      validator: null,
      readOnly: true,
      onTap: () => showPlatformSearch(context: context, delegate: SearchView()),
      suffix: withButton
          ? OutlinedButton.icon(
              onPressed: () => router.push(const FilterRouter()),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(AppColor.dark),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.0475.sw),
                ),
                side: MaterialStateProperty.all(BorderSide(color: AppColor.light, width: 1.0.sp)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              label: CustomTextBold('KONUM', fontSize: 8.sp),
              icon: Icon(AppIcon.map_marker, size: 18.sp,),
            )
          : const Icon(Icons.location_searching, color: AppColor.primary),
    );
  }
}
