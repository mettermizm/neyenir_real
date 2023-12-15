import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/button/base_button.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final bool outline;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback onPressed;

  const SecondaryButton({
    Key? key,
    required this.title,
    this.icon,
    this.iconSize,
    required this.onPressed,
    this.outline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return outline
        ? BaseButton(
            title: title,
            outline: true,
            icon: icon,
            iconSize: iconSize,
            textColor: AppColor.secondary,
            primaryColor: AppColor.secondary[100]!,
            backgroundColor: AppColor.secondary,
            onPressed: onPressed,
          )
        : BaseButton(
            title: title,
            icon: icon,
            iconSize: iconSize,
            textColor: Colors.white,
            primaryColor: AppColor.secondary[200]!,
            backgroundColor: AppColor.secondary,
            onPressed: onPressed,
          );
  }
}
