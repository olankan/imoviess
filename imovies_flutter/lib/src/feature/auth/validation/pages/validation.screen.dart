import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20in/providers/signInStateProvider.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20up/pages/signup.screen.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20up/providers/signUpStateProvider.dart';
import 'package:imovies_flutter/src/core/widgets/custom_Circular_Progress_Indicator/circular_progress_indicator.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_container/custom_container.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';

class ValidationScreen extends ConsumerWidget {
  const ValidationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpStateProvider = ref.watch(signUpStateNotifierProvider);
    final signUpStateRef = ref.read(signUpStateNotifierProvider.notifier);
    final signInStateProvider = ref.watch(signInStateNotifierProvider);
    final signInStateRef = ref.read(signInStateNotifierProvider.notifier);
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
                    Text(
                      'Check your inbox',
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w500),
                    ),
                    5.verticalSpace,
                    Text(
                      'We have sent you a verification code by email',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: fontFamily,
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // 'olankanodeyemi2205@gmail.com',

                          signUpStateProvider.emailController!.text,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w600),
                        ),
                        2.horizontalSpace,
                        Icon(
                          Icons.edit_note_rounded,
                          color: Color(0xFFA9A9A9),
                          size: 16.r,
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    CustomTextFormField.validationCode(
                      formKey: signUpStateProvider.validationCodeFormKey,
                      validator: (val) {
                        if (val!.length > 8) {
                          return 'OTP must be 8 characters';
                        }
                        return null;
                      },
                      width: 150.w,
                      hintText: 'Enter code',
                      controller: signUpStateProvider.validationCodeController,
                    ),
                    10.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        // if (((signUpStateProvider.emailFormKey!.currentState!
                        //                 .validate() ||
                        //             signInStateProvider
                        //                 .emailFormKey!.currentState!
                        //                 .validate()) &&
                        //         (signUpStateProvider
                        //                 .passwordFormKey!.currentState!
                        //                 .validate() ||
                        //             signInStateProvider
                        //                 .passwordFormKey!.currentState!
                        //                 .validate()) ||
                        //     (signUpStateProvider
                        //         .confirmPasswordFormKey!.currentState!
                        //         .validate()))) {
                        ///
                        signUpStateRef.signUpWithEmail(context);
                        // }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send again',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: fontFamily,
                            ),
                          ),
                          2.horizontalSpace,
                          Icon(
                            Icons.restart_alt_rounded,
                            color: Color(0xFFA9A9A9),
                            size: 14.r,
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    CustomContainer(
                      height: 48.h,
                      width: 200.w,
                      backgroundColor: Color(0xffD92226),
                      radius: 14.r,
                      child: Center(
                        child: signUpStateProvider.isLoading!
                            ? CustomCircularProgressIndicator()
                            : Text('Sign in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: fontFamily,
                                    fontWeight: FontWeight.w500)),
                      ),
                      onTap: () {
                        if (signUpStateProvider
                            .validationCodeFormKey!.currentState!
                            .validate()) {
                          signUpStateRef.validateAccount(context,
                              onSignedIn: () {
                            context.push('/home');
                            print('Signed in successfully::::::::::::::::');
                          });
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
