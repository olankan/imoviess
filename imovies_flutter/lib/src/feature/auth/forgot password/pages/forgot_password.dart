import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/feature/auth/forgot%20password/pages/password_reset.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20in/providers/signInStateProvider.dart';
import 'package:imovies_flutter/src/feature/auth/validation/pages/validation.screen.dart';
import 'package:imovies_flutter/src/core/widgets/custom_Circular_Progress_Indicator/circular_progress_indicator.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_container/custom_container.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInstateProvider = ref.watch(signInStateNotifierProvider);
    final signInstateRef = ref.read(signInStateNotifierProvider.notifier);

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
                      'Forgot your password?',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w500),
                    ),
                    5.verticalSpace,
                    Text(
                      'Enter your email to recover your password',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: fontFamily,
                      ),
                    ),
                    10.verticalSpace,

                    CustomTextFormField.emailAddress(
                      formKey: signInstateProvider.emailResetFormKey,
                      controller: signInstateProvider.emailController,
                      validator: signInstateProvider.emailValidator,
                      width: 300.w,
                      hintText: 'Email',
                    ),

                    30.verticalSpace,
                    CustomContainer(
                      height: 48.h,
                      width: 250.w,
                      backgroundColor: Color(0xffD92226),
                      radius: 14.r,
                      child: Center(
                        child: signInstateProvider.isLoading!
                            ? CustomCircularProgressIndicator()
                            : Text('Recover password',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.w500)),
                      ),
                      onTap: () {
                        if (signInstateProvider.emailResetFormKey!.currentState!
                            .validate()) {
                          signInstateRef.initiatePasswordReset(context);
                      
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
