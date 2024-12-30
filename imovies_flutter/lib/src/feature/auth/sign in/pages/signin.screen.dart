import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/feature/auth/forgot%20password/pages/forgot_password.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20in/providers/signInStateProvider.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20up/pages/signup.screen.dart';
import 'package:imovies_flutter/src/core/widgets/custom_container/custom_container.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';

class SigninScreen extends ConsumerWidget {
  const SigninScreen({super.key});

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
          backgroundColor: Colors.black.withOpacity(0.8),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w),
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
                            Hero(
                              tag: 'logo',
                              child: Image.asset(
                                'assets/images/movie-logo.jpg',
                                height: 50.h,
                              ),
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
                      formKey: signInstateProvider.emailFormKey,
                      controller: signInstateProvider.emailController,
                      validator: signInstateProvider.emailValidator,
                    ),
                    10.verticalSpace,
                    CustomTextFormField.password(
                      hintText: 'Password',
                      obscureText: signInstateProvider.obscurePassword,
                      controller: signInstateProvider.passwordController,
                      formKey: signInstateProvider.passwordFormKey,
                      validator: signInstateProvider.passwordValidator,
                      onTapSuffix: () {
                        signInstateRef.obscurePassword();
                      },
                    ),
                    20.verticalSpace,
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
                                    value: signInstateProvider.rememberMe,
                                    activeColor: Colors.white,
                                    onChanged: (newBool) {
                                      signInstateRef.updateState(
                                          signInstateProvider.copyWith(
                                              rememberMe: newBool));
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Text('Remember me',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ))
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              context.push('/forgotPassword');
                            },
                            child: Text('Forgot password?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                )),
                          )
                        ]),
                    30.verticalSpace,
                    CustomContainer(
                      height: 48.h,
                      width: double.infinity,
                      backgroundColor: Color(0xffD92226),
                      radius: 14.r,
                      child: Center(
                        child: Text('Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            )),
                      ),
                      onTap: () {
                         Future.delayed(Duration(seconds: 2));
                        if (signInstateProvider.emailFormKey!.currentState!
                                .validate() &&
                            signInstateProvider.passwordFormKey!.currentState!
                                .validate()) {
                          print(signInstateProvider.emailFormKey!.currentState!
                              .validate());
                          signInstateRef.signInWithEmail(context, () {
                            print('SUCCESSFULLY SIGNED IN');
                          });
                        }
                      },
                    ),
                    10.verticalSpace,
                    Text('OR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        )),
                    10.verticalSpace,
                    CustomContainer(
                      height: 48.h,
                      width: double.infinity,
                      borderColor: Colors.white,
                      backgroundColor: Colors.black,
                      radius: 14.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/google.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          10.horizontalSpace,
                          Text('Sign in with Google',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              )),
                        ],
                      ),
                    ),
                    170.verticalSpace,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          context.push('/signUp');
                        },
                        child: RichText(
                          text: TextSpan(
                              text: '''Don't have an account? ''',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Sign up',
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
                    // SignInWithEmailButton(caller: client.modules.auth)
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
