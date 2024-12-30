import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20up/providers/signUpStateProvider.dart';
import 'package:imovies_flutter/src/core/widgets/custom_Circular_Progress_Indicator/circular_progress_indicator.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_container/custom_container.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/customSnackbar/customSnackbar.widget.dart';
import 'package:imovies_flutter/src/core/utils/api_client.dart';
import 'package:imovies_flutter/src/core/utils/singletons.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpStateProvider = ref.watch(signUpStateNotifierProvider);
    final signUpStateRef = ref.read(signUpStateNotifierProvider.notifier);

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
                      formKey: signUpStateProvider.emailFormKey,
                      validator: signUpStateProvider.emailValidator,
                      controller: signUpStateProvider.emailController,
                    ),
                    10.verticalSpace,
                    CustomTextFormField.password(
                      hintText: 'Password',
                      formKey: signUpStateProvider.passwordFormKey,
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
                      formKey: signUpStateProvider.confirmPasswordFormKey,
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
                      backgroundColor: Color(0xffD92226),
                      radius: 14.r,
                      child: Center(
                        child: signUpStateProvider.isLoading!
                            ? CustomCircularProgressIndicator()
                            : Text('Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                )),
                      ),
                      onTap: () {
                        if (signUpStateProvider.policyAgreement != true) {
                          customSnackBar(context, 'Agree to our policy',
                              bgColor: Colors.black);
                        }
                        if (signUpStateProvider.emailFormKey!.currentState!
                                .validate() &&
                            signUpStateProvider.passwordFormKey!.currentState!
                                .validate() &&
                            signUpStateProvider
                                .confirmPasswordFormKey!.currentState!
                                .validate() &&
                            signUpStateProvider.policyAgreement == true) {
                          ///
                          signUpStateRef.signUpWithEmail(context);
                      
                        }
                      },
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
                                  side: BorderSide(
                                    color:
                                        // signUpStateProvider.policyAgreement !=
                                        //         true
                                        // ? Color(0xffD92226)
                                        // :
                                        Colors.white,
                                  ),
                                  activeColor: Colors.white,
                                  value: signUpStateProvider.policyAgreement,
                                  onChanged: (newBool) {
                                    signUpStateRef.updateState(
                                        signUpStateProvider.copyWith(
                                            policyAgreement: newBool));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            10.horizontalSpace,
                            SizedBox(
                              width: 270.w,
                              child: RichText(
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
                                          text: '''Privacy Policy.''',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ]),
                              ),
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
                    // SignInWithEmailButton(
                    //   caller: singleton<ApiClient>().client.modules.auth,
                    //   onSignedIn: () {
                    //     print('WELCOME ;;;;;');
                    //   },
                    // )
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
