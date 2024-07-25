// ignore_for_file: empty_constructor_bodies, prefer_const_constructors, unnecessary_this, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInState extends Equatable {
  final GlobalKey<FormState>? emailFormKey;
  final GlobalKey<FormState>? passwordFormKey;
  final TextEditingController? emailController;

  final TextEditingController? passwordController;
  bool? obscurePassword;

  bool? isLoading;
  bool? rememberMe;
String? Function(String?)? emailValidator;
String? Function(String?)? passwordValidator;

  SignInState({
    this.emailFormKey,
    this.passwordFormKey,
    required this.passwordController,
    required this.emailController,
    this.obscurePassword,
   
    this.isLoading,
    this.rememberMe,
    this.emailValidator,
    this.passwordValidator,
  });

  bool? validateEmail(BuildContext context, String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
          )),
          backgroundColor: Colors.red,
          content: Text(
            'Please enter a valid email',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
      return false;
    }
    return true;
  }

  bool? validatePassword(
    BuildContext context,
    String password,
  ) {
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
          )),
          backgroundColor: Colors.red,
          content: Text(
            'Please input your password',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
      return false;
    }
    return true;
  }

  bool? validateConfirmPasswords(BuildContext context, String password,
      {String? confirmPassword}) {
    if (confirmPassword != password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
          )),
          backgroundColor: Colors.red,
          content: Text(
            'Passwords do not match',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
      return false;
    } else if (confirmPassword!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14.r),
            topRight: Radius.circular(14.r),
          )),
          backgroundColor: Colors.red,
          content: Text(
            'Please confirm your password',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
    return true;
  }

  SignInState copyWith({
    GlobalKey<FormState>? emailFormKey,
    GlobalKey<FormState>? passwordFormKey,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    bool? isLoading,
    bool? rememberMe,
   String? Function(String?)? emailValidator,
   String? Function(String?)? passwordValidator,
  }) {
    return SignInState(
      emailFormKey: emailFormKey ?? this.emailFormKey,
      passwordFormKey: passwordFormKey ?? this.passwordFormKey,
      passwordController: passwordController ?? this.passwordController,
      emailController: emailController ?? this.emailController,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    
      isLoading: isLoading ?? this.isLoading,
      rememberMe: rememberMe ?? this.rememberMe,
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
    );
  }

  @override
  List<Object?> get props => [
        emailFormKey,
        passwordFormKey,
        emailController,
        passwordController,
        obscurePassword, 
        isLoading,
        rememberMe,
        emailValidator,
        passwordValidator,
      ];
}
