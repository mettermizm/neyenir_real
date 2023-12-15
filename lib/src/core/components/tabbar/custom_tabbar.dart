// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class CustomTabbar extends StatelessWidget {
  CustomTabbar({
    Key? key,
    required this.tab,
    required this.tabController,
    this.cachedFromIdx,
    this.cachedToIdx,
    this.border = true,
  }) : super(key: key);

  final List<String> tab;
  final TabController tabController;
  int? cachedFromIdx;
  int? cachedToIdx;
  bool? border;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .035.sw),
      child: TabBar(
        controller: tabController,
        tabs: tab.asMap().entries.map((entry) => _animatedBuilder(entry)).toList(),
        physics: const ClampingScrollPhysics(),
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        indicator: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }

  AnimatedBuilder _animatedBuilder(MapEntry<int, String> entry) {
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (_, __) {
        final forward = tabController.offset > 0;
        final backward = tabController.offset < 0;
        int fromIndex;
        int toIndex;
        double progress;
        if (tabController.indexIsChanging) {
          fromIndex = tabController.previousIndex;
          toIndex = tabController.index;
          cachedFromIdx = tabController.previousIndex;
          cachedToIdx = tabController.index;
          progress =
              (tabController.animation!.value - fromIndex).abs() / (toIndex - fromIndex).abs();
        } else {
          if (cachedFromIdx == tabController.previousIndex && cachedToIdx == tabController.index) {
            fromIndex = cachedFromIdx!;
            toIndex = cachedToIdx!;
            progress = 1;
            cachedToIdx = 0;
            cachedFromIdx = 0;
          } else {
            cachedToIdx = 0;
            cachedFromIdx = 0;
            fromIndex = tabController.index;
            toIndex = forward
                ? fromIndex + 1
                : backward
                    ? fromIndex - 1
                    : fromIndex;
            progress = (tabController.animation!.value - fromIndex).abs();
          }
        }

        return _customIndicator(entry, fromIndex, toIndex, progress, border!);
      },
    );
  }

  Container _customIndicator(
    MapEntry<int, String> entry,
    int fromIndex,
    int toIndex,
    double progress,
    bool border,
  ) {
    return Container(
      alignment: Alignment.center,
      height: .1.sw,
      decoration: BoxDecoration(
        border: border ? Border.all(width: 1) : null,
        borderRadius: BorderRadius.circular(10.r),
        color: entry.key == fromIndex
            ? Color.lerp(AppColor.primary, Colors.white, progress)
            : entry.key == toIndex
                ? Color.lerp(Colors.white, AppColor.primary, progress)
                : Color.lerp(Colors.white, Colors.white, progress),
      ),
      child: CustomTextMedium(
        entry.value,
        fontSize: 10.sp,
        color: entry.key == fromIndex
            ? Color.lerp(Colors.white, AppColor.primary, progress)
            : entry.key == toIndex
                ? Color.lerp(AppColor.primary, Colors.white, progress)
                : Color.lerp(AppColor.primary, AppColor.primary, progress),
      ),
    );
  }
}
