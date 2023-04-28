import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:movies/constance/theme.dart';

class LoadingGridCircleWidget extends StatelessWidget {
  const LoadingGridCircleWidget(
      {super.key,
      this.backgroundColor,
      this.borderColor,
      this.borderSize,
      this.size});
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderSize;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingBouncingGrid.circle(
        backgroundColor: backgroundColor ?? MyColor.grey,
        borderColor: borderColor ?? MyColor.secondryColor,
        borderSize: borderSize,
        size: size ?? 50.0,
      ),
    );
  }
}

class LoadingSliverGridCircleWidget extends StatelessWidget {
  const LoadingSliverGridCircleWidget(
      {super.key,
      this.backgroundColor,
      this.borderColor,
      this.borderSize,
      this.size});
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderSize;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: LoadingBouncingGrid.circle(
          backgroundColor: backgroundColor ?? MyColor.grey,
          borderColor: borderColor ?? MyColor.secondryColor,
          borderSize: borderSize,
          size: size ?? 50.0,
        ),
      ),
    );
  }
}
