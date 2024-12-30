import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomModalSheet extends StatefulWidget {
  const CustomBottomModalSheet({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  State<CustomBottomModalSheet> createState() => _CustomBottomModalSheetState();
}

class _CustomBottomModalSheetState extends State<CustomBottomModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.1, sigmaY: 2.1),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35.r),
                ),
              ),
              width: double.infinity,
              height: widget.height?.h ?? 474.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40.w,
                      height: 4.h,
                      margin: EdgeInsets.symmetric(vertical: 8.r),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  widget.child ?? const SizedBox.shrink(),
                ],
              ))),
    );
  }
}
