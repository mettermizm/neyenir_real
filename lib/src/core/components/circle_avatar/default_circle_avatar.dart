import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/enums/image_source.dart';

/// This is a widget that displays a circle avatar with a network image.
class DefaultCircleAvatar extends StatelessWidget {
  const DefaultCircleAvatar(
    this.url, {
    Key? key,
    this.source = ImageSource.network,
    this.radius,
  }) : super(key: key);

  final String url;
  final double? radius;
  final ImageSource? source;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 32.r,
      foregroundImage:
          (source == ImageSource.network ? NetworkImage(url) : AssetImage(url)) as ImageProvider,
    );
  }
}

class MediumAvatar extends CircleAvatar {
  MediumAvatar(
    String url, {
    Key? key,
  }) : super(
          key: key,
          radius: 20.0.r,
          backgroundColor: AppColor.dark,
          backgroundImage: NetworkImage(url),
        );
}
