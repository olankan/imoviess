import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
 
 
class GlassMorphicBackground extends StatelessWidget {
  const GlassMorphicBackground(
      {super.key, this.child, this.height, this.width, this.radius});

  final Widget? child;
  final double? height;
  final double? width;
final double? radius;
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width ?? 50.w,
      height: height ?? 50.h,
      borderRadius: radius ?? 16.r,
      border: 0,
      blur: 15,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.black.withOpacity(0.2),
          Colors.black.withOpacity(0.1),
        ],
        stops: const [0.1, 1],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0),
          const Color((0xFFFFFFFF)).withOpacity(0),
        ],
      ),
      child: child,
    );
  }
}
