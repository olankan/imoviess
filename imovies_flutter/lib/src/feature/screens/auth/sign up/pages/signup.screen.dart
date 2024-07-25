import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/feature/components/constants.dart';
import 'package:imovies_flutter/src/feature/screens/auth/sign%20up/providers/signUpStateProvider.dart';
import 'package:imovies_flutter/src/feature/widgets/custom_container/custom_container.widget.dart';
import 'package:imovies_flutter/src/feature/widgets/custom_text_field/custom_text_field.widget.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpStateProvider = ref.watch(signUpStateNotifierProvider);
    final signUpStateRef = ref.read(signUpStateNotifierProvider.notifier);
    final policyAgreementRef = ref.watch(policyAgreementProvider);
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
          backgroundColor: Colors.black.withOpacity(0.8),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    170.verticalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                      ],
                    ),
                    CustomTextFormField.emailAddress(
                      hintText: 'Email',
                      key: signUpStateProvider.emailFormKey,
                      validator: signUpStateProvider.emailValidator,
                      controller: signUpStateProvider.emailController,
                    ),
                    10.verticalSpace,
                    CustomTextFormField.password(
                      hintText: 'Password',
                      key: signUpStateProvider.passwordFormKey,
                      obscureText: signUpStateProvider.obscurePassword,
                      validator: signUpStateProvider.passwordValidator,
                      controller: signUpStateProvider.passwordController,
                      onTapSuffix: () {
                        signUpStateRef.obscurePassword();
                      },
                    ),
                    10.verticalSpace,
                    CustomTextFormField.confirmPassword(
                      hintText: 'Confirm Password',
                      key: signUpStateProvider.confirmPasswordFormKey,
                      obscureText: signUpStateProvider.obscureConfirmPassword,
                      validator: (val) {
                        if (val !=
                            signUpStateProvider.passwordController!.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      controller: signUpStateProvider.confirmPasswordController,
                      onTapSuffix: () {
                        signUpStateRef.obscureConfirmPassword();
                      },
                    ),
                    20.verticalSpace,
                    CustomContainer(
                      height: 48.h,
                      width: double.infinity,
                      backgroundColor: Colors.red,
                      radius: 14.r,
                      child: Center(
                        child: Text('Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            )),
                      ),
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.w,
                              color: Colors.transparent,
                              child: Transform.scale(
                                scale: 1.0,
                                child: Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  side: BorderSide(color: Colors.white),
                                  activeColor: Colors.white,
                                  value: policyAgreementRef,
                                  onChanged: (newBool) {
                                    // signUpStateRef.policyAgreement();
                                    // print(signUpStateProvider.policyAgreement);
                                    ref
                                        .watch(policyAgreementProvider.notifier)
                                        .state = newBool!;
                                    // print(policyAgreementRef);
                                    // print(newBool);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                            RichText(
                              text: TextSpan(
                                  text: 'I agree to ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            '''iMOVIES's Terms and Conditions of Use ''',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    TextSpan(
                                        text: 'and ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                        )),
                                    TextSpan(
                                        text: '''Privacy \nPolicy.''',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    215.verticalSpace,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Sign in',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 1.5))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
