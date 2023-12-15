import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.title,
    required this.textColor,
    required this.primaryColor,
    required this.backgroundColor,
    this.icon,
    required this.onPressed,
    this.outline = false,
    this.onLeft = false,
    this.fontSize,
    this.iconSize,
  }) : super(key: key);

  final String title;
  final Color textColor;
  final Color primaryColor;
  final Color backgroundColor;
  final bool outline;
  final IconData? icon;
  final bool onLeft;
  final VoidCallback onPressed;
  final double? fontSize;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              primary: primaryColor,
              backgroundColor: outline ? Colors.transparent : backgroundColor,
              padding: EdgeInsets.symmetric(horizontal: .015.sh, vertical: .0125.sh),
              side: BorderSide(
                width: outline ? 1 : 0,
                color: outline ? backgroundColor : Colors.transparent,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
            ),
            child: CustomTextLight(title, fontSize: 10.sp, color: textColor),
          )
        : Directionality(
            textDirection: onLeft ? TextDirection.ltr : TextDirection.rtl,
            child: OutlinedButton.icon(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                primary: primaryColor,
                backgroundColor: outline ? Colors.transparent : backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: .015.sh, vertical: .005.sh),
                side: BorderSide(
                  width: outline ? 1.sp : 0,
                  color: outline ? backgroundColor : Colors.transparent,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
              ),
              label: CustomTextLight(title, fontSize: fontSize ?? 10.sp, color: textColor),
              icon: Icon(icon, color: textColor, size: iconSize ?? 20.0),
            ),
          );
  }
}
