import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/constants/svg_constants.dart';
import 'package:neyenir_app/src/core/mixins/widgets_binding_mixin.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin, StateMixin {
  late AnimationController _animationController;

  double _height = .9.sh;

  @override
  void initState() {
    super.initState();
    afterPageRendered(() => setState(() => _height = .15.sh));
    _gotoHome();
    _animations();
  }

  void _gotoHome() => Timer(const Duration(seconds: 2), () => router.replace(const HomeRouter()));

  void _animations() {
    _animationController = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        height: _height,
        alignment: Alignment.bottomCenter,
        duration: const Duration(seconds: 1),
        child: SvgPicture.asset(SVGConstants.neyenir),
      ),
    );
  }
}
