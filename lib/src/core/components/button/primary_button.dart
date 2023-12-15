// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/button/base_button.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool outline;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.outline = false,
    this.icon,
    this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return outline
        ? BaseButton(
            title: title,
            outline: true,
            textColor: AppColor.primary,
            primaryColor: AppColor.primary[100]!,
            backgroundColor: AppColor.primary,
            icon: icon,
            iconSize: iconSize,
            onPressed: onPressed,
          )
        : BaseButton(
            title: title,
            textColor: Colors.white,
            primaryColor: AppColor.primary[200]!,
            backgroundColor: AppColor.primary,
            icon: icon,
            iconSize: iconSize,
            onPressed: onPressed,
          );
  }
}
