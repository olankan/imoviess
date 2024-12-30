import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.radius,
    this.borderColor,
    this.gradient,
    this.child,
    this.leftMargin,
    this.rightMargin,
    this.padding, this.onTap,
  });

  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final Widget? child;
  final Gradient? gradient;
  final double? leftMargin;
  final double? rightMargin;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: EdgeInsets.only(right: rightMargin ?? 0, left: leftMargin ?? 0).r,
        height: height ?? 50.h,
        width: width ?? 50.w,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 14),
            border: Border.all(color: borderColor ?? Colors.transparent),
            gradient: gradient),
        child: child,
      ),
    );
  }
}
