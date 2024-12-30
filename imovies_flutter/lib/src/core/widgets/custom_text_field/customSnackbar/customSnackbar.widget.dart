import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/core/widgets/custom_container/custom_container.widget.dart';

void customSnackBar(BuildContext context, String message,
    {Color? bgColor, Color? textColor, Color? borderColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: Colors.transparent,
        content: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.1, sigmaY: 2.1),
          child: CustomContainer(
            backgroundColor: Colors.transparent,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomContainer(
                  backgroundColor: bgColor ?? Colors.black,
                  borderColor: borderColor ?? Colors.red,
                  width: 250.w,
                  height: 40.h,
                  child: Center(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w500,
                        color: textColor ?? Colors.red,
                        // Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )),
  );
}
