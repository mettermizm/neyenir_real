import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/button/base_button.dart';

class SuccessButton extends StatelessWidget {
  final String title;
  final bool outline;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback onPressed;

  const SuccessButton(
      {Key? key,
      required this.title,
      this.icon,
      required this.onPressed,
      this.outline = false,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return outline
        ? BaseButton(
            title: title,
            outline: true,
            icon: icon,
            iconSize: iconSize,
            textColor: AppColor.success,
            primaryColor: AppColor.success[100]!,
            backgroundColor: AppColor.success[700]!,
            onPressed: onPressed,
          )
        : BaseButton(
            title: title,
            icon: icon,
            iconSize: iconSize,
            textColor: Colors.white,
            primaryColor: AppColor.success[200]!,
            backgroundColor: AppColor.success[700]!,
            onPressed: onPressed,
          );
  }
}
