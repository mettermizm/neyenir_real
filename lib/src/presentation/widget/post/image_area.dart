import 'package:flutter/material.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/image/radius_image.dart';

class ImageArea extends StatelessWidget {
  const ImageArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => router.push(const ProductRouter()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxWidth,
            width: constraints.maxWidth,
            child: RadiusImage(
                'https://cdn1.ntv.com.tr/gorsel/LyBbdJvJuE2ULhdczuTgCQ.jpg?width=1000&mode=crop&scale=both'),
          );
        },
      ),
    );
  }
}
