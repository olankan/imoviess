import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.height,
      this.width,
      this.backgroundColor,
      this.radius,
      this.borderColor,
      this.gradient,
      this.child,
      this.margin,
      this.wantBoxShadow = false,
      this.onTap,
      this.padding});

  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final Widget? child;
  final Gradient? gradient;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool? wantBoxShadow;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height ?? 50.h,
      width: width ?? 50.w,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:
                  wantBoxShadow == true ? Colors.black54 : Colors.transparent,
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 14.r),
          border: Border.all(color: borderColor ?? Colors.transparent),
          gradient: gradient),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(radius ?? 14.r),
            child: child),
      ),
    );
  }
}
