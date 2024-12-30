// ignore_for_file: empty_constructor_bodies, prefer_const_constructors, unnecessary_this, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInState extends Equatable {
  final GlobalKey<FormState>? emailFormKey;
  final GlobalKey<FormState>? emailResetFormKey;
  final GlobalKey<FormState>? passwordFormKey;
  final GlobalKey<FormState>? passwordResetFormKey;
  final TextEditingController? emailController;
  final TextEditingController? validationCodeController;

  final TextEditingController? passwordController;
  bool? obscurePassword;

  bool? isLoading;
  bool? rememberMe;
  String? Function(String?)? emailValidator;
  String? Function(String?)? passwordValidator;

  SignInState({
    this.emailResetFormKey,
    this.validationCodeController,
    this.emailFormKey,
    this.passwordFormKey,
    this.passwordResetFormKey,
    required this.passwordController,
    required this.emailController,
    this.obscurePassword,
    this.isLoading,
    this.rememberMe,
    this.emailValidator,
    this.passwordValidator,
  });

  SignInState copyWith({
    TextEditingController? validationCodeController,
    GlobalKey<FormState>? emailFormKey,
    GlobalKey<FormState>? emailResetFormKey,
    GlobalKey<FormState>? passwordFormKey,
    GlobalKey<FormState>? passwordResetFormKey,
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
      emailResetFormKey: emailResetFormKey ?? this.emailResetFormKey,
      passwordFormKey: passwordFormKey ?? this.passwordFormKey,
      passwordResetFormKey: passwordResetFormKey ?? this.passwordResetFormKey,
      passwordController: passwordController ?? this.passwordController,
      emailController: emailController ?? this.emailController,
      validationCodeController:
          validationCodeController ?? this.validationCodeController,
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
        emailResetFormKey,
        passwordFormKey,
        passwordResetFormKey,
        emailController,
        passwordController,
        validationCodeController,
        obscurePassword,
        isLoading,
        rememberMe,
        emailValidator,
        passwordValidator,
      ];
}
