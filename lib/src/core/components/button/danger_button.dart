import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/button/base_button.dart';

class DangerButton extends StatelessWidget {
  final String title;
  final bool outline;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback onPressed;

  const DangerButton({
    Key? key,
    required this.title,
    this.icon,
    required this.onPressed,
    this.outline = false,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return outline
        ? BaseButton(
            title: title,
            outline: true,
            textColor: AppColor.danger,
            primaryColor: AppColor.danger[100]!,
            backgroundColor: AppColor.danger,
            icon: icon,
            iconSize: iconSize,
            onPressed: onPressed,
          )
        : BaseButton(
            title: title,
            textColor: Colors.white,
            primaryColor: AppColor.danger[200]!,
            backgroundColor: AppColor.danger,
            icon: icon,
            iconSize: iconSize,
            onPressed: onPressed,
          );
  }
}
