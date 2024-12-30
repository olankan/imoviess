import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20in/providers/signInStateProvider.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20up/providers/signUpStateProvider.dart';
import 'package:imovies_flutter/src/core/widgets/custom_Circular_Progress_Indicator/circular_progress_indicator.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_container/custom_container.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/customSnackbar/customSnackbar.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';

class PasswordResetScreen extends ConsumerWidget {
  PasswordResetScreen({super.key});

  final valCodeFormKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInstateProvider = ref.watch(signInStateNotifierProvider);
    final signInstateRef = ref.read(signInStateNotifierProvider.notifier);
    final signUpStateProvider = ref.watch(signUpStateNotifierProvider);
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/gifs/sign_up_background.gif',
            fit: BoxFit.cover,
          ),
        ),
        CustomContainer(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            backgroundColor: Colors.black.withOpacity(0.8),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    170.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/movie-logo.jpg',
                          height: 50.h,
                        ),
                        Text(
                          'i',
                          style: TextStyle(
                            fontSize: 40.sp,
                            fontFamily: fontFamily,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset(
                          'assets/images/movies.jpg',
                          height: 30.h,
                        ),
                        20.horizontalSpace
                      ],
                    ),
                    // Icon(
                    //   Icons.lock_outline,
                    //   color: Colors.red,
                    //   size: 60.r,
                    // ),
                    Text(
                      'Reset your password',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w500),
                    ),
                    5.verticalSpace,
                    Text(
                      'Please enter and verify your new password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: fontFamily,
                      ),
                    ),
                    10.verticalSpace,
                    CustomTextFormField.validationCode(
                      formKey: valCodeFormKey2,
                      validator: (val) {
                        if (val!.length > 8) {
                          return 'OTP must be 8 characters';
                        }
                        return null;
                      },
                      width: 300.w,
                      hintText: 'Enter code',
                      controller: signInstateProvider.validationCodeController,
                    ),
                    10.verticalSpace,
                    CustomTextFormField.password(
                      width: 300.w,
                      formKey: signInstateProvider.passwordResetFormKey,
                      controller: signInstateProvider.passwordController,
                      obscureText: signInstateProvider.obscurePassword,
                      hintText: 'New password',
                      validator: signInstateProvider.passwordValidator,
                      onTapSuffix: () {
                        signInstateRef.obscurePassword();
                      },
                    ),

                    30.verticalSpace,
                    CustomContainer(
                      height: 48.h,
                      width: 150.w,
                      backgroundColor: Color(0xffD92226),
                      radius: 14.r,
                      child: Center(
                        child: signInstateProvider.isLoading!
                            ? CustomCircularProgressIndicator()
                            : Text('Done',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.w500)),
                      ),
                      onTap: () {
                        if (signInstateProvider
                            .passwordResetFormKey!.currentState!
                            .validate()) {
                          signInstateRef.resetPassword(context, () {
                            print('Password reset successful');
                            // customSnackBar(context, 'Reset successful',
                            //     textColor: Colors.black, bgColor: Colors.white);
                            context.pop(context);
                            context.pop(context);
                          });
                        } else {
                          customSnackBar(
                            context,
                            'Wrong code',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
