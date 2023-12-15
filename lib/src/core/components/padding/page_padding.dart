import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A widget that adds padding to its child.
class PagePadding extends StatelessWidget {
  const PagePadding({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: CustomPadding.symmetric(), child: child);
  }
}

class CustomPadding extends EdgeInsets {
  CustomPadding.symmetric() : super.symmetric(horizontal: 0.075.sw, vertical: 0.025.sw);
}
