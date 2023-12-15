import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';

/// It's a TextFormField with a bunch of default values
class DefaultTextFormField extends TextFormField {
  DefaultTextFormField({
    Key? key,
    required TextEditingController? controller,
    required String? Function(String?)? validator,
    required String title,
    bool obscure = false,
    int? length,
    bool readOnly = false,
    bool autoFocus = false,
    bool verified = false,
    void Function()? onTap,
    TextInputType textInputType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Widget? suffix,
  }) : super(
          key: key,
          autocorrect: false,
          cursorColor: AppColor.primary,
          obscureText: obscure,
          controller: controller,
          keyboardType: textInputType,
          readOnly: readOnly,
          enableSuggestions: false,
          autofocus: autoFocus,
          textCapitalization: textCapitalization,
          keyboardAppearance: Brightness.light,
          maxLength: length ?? length,
          maxLines: length == null ? 1 : 5,
          minLines: 1,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.sp),
            suffixIcon: suffix,
            prefixIcon: verified
                ? const Icon(
                    Icons.check_circle,
                    color: AppColor.success,
                  )
                : null,
            hintText: title,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
          onTap: onTap,
        );
}
