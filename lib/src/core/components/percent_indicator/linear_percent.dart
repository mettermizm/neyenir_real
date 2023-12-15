import 'package:flutter/material.dart';

class LinearPercent extends StatelessWidget {
  const LinearPercent({
    Key? key,
    this.score,
    this.total,
    this.limit,
    this.borderHeight = 6,
    this.color,
    this.decoration,
    this.foregroundDecoration,
  }) : super(key: key);

  /// If it's not null, it requires it to have exactly that score.
  final double? score;

  /// If it's not null, it requires it to have exactly that total.
  final int? total;

  /// If it's not null, it requires it to have exactly that limit.
  final int? limit;

  /// If it's not null, it requires it to have exactly that limit.
  final double borderHeight;

  /// Use the [color] property to specify a simple solid color.
  final Color? color;

  /// The decoration to paint behind the [linear].
  final Decoration? decoration;

  /// The decoration to paint in front of the [linear].
  final Decoration? foregroundDecoration;

  @override
  Widget build(BuildContext context) {
    Decoration currentDecoration;
    Decoration currentForegroundDecoration;

    if (decoration != null) {
      currentDecoration = decoration!;
    } else {
      currentDecoration = BoxDecoration(color: Colors.grey[200]);
    }

    if (foregroundDecoration != null) {
      currentForegroundDecoration = foregroundDecoration!;
    } else {
      currentForegroundDecoration = const BoxDecoration(color: Colors.black);
    }

    return Expanded(
      child: LayoutBuilder(
        builder: (_, BoxConstraints boxConstraints) {
          final double containerWidth = boxConstraints.maxWidth;
          final dynamic calculateLimit = limit ?? containerWidth;
          final double calculateWidth = ((score ?? 0) / (total ?? 5)) * calculateLimit;
          return Stack(
            children: [
              Container(
                width: containerWidth,
                height: borderHeight,
                decoration: currentDecoration,
              ),
              Container(
                width: calculateWidth,
                height: borderHeight,
                decoration: currentForegroundDecoration,
              ),
            ],
          );
        },
      ),
    );
  }
}
