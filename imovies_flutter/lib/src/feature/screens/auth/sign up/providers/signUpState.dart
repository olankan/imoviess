// ignore_for_file: empty_constructor_bodies, prefer_const_constructors, unnecessary_this

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpState extends Equatable {
  final GlobalKey<FormState>? emailFormKey;
  final GlobalKey<FormState>? passwordFormKey;
  final GlobalKey<FormState>? confirmPasswordFormKey;
  final TextEditingController? emailController;
  final TextEditingController? userNameController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final TextEditingController? validationCodeController;
  bool? obscurePassword;
  bool? obscureConfirmPassword;
  bool? policyAgreement;
  bool? isLoading;
  String? Function(String?)? emailValidator;
  String? Function(String?)? passwordValidator;

  SignUpState(
      {this.emailFormKey,
      this.passwordFormKey,
      this.confirmPasswordFormKey,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.emailController,
      this.validationCodeController,
      this.passwordValidator,
      required this.emailValidator,
      required this.userNameController,
      this.obscurePassword,
      this.obscureConfirmPassword,
      this.policyAgreement,
      this.isLoading});

  // bool? validateEmail(BuildContext context, String? email) {
  //   RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
  //   final isEmailValid = emailRegex.hasMatch(email ?? '');
  //   if (!isEmailValid) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(14.r),
  //           topRight: Radius.circular(14.r),
  //         )),
  //         backgroundColor: Colors.red,
  //         content: Text(
  //           'Please enter a valid email',
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       ),
  //     );
  //     return false;
  //   }
  //   return true;
  // }

  // bool? validatePassword(
  //   BuildContext context,
  //   String password,
  // ) {
  //   if (password.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(14.r),
  //           topRight: Radius.circular(14.r),
  //         )),
  //         backgroundColor: Colors.red,
  //         content: Text(
  //           'Please input your password',
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       ),
  //     );
  //     return false;
  //   } else if (password.length < 8) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(14.r),
  //           topRight: Radius.circular(14.r),
  //         )),
  //         backgroundColor: Colors.red,
  //         content: Text(
  //           'Password: At least 8 characters.',
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       ),
  //     );
  //     return false;
  //   }
  //   return true;
  // }

  // bool checkPasswordStrength() {
  //   bool isNumber = passwordController!.text.contains(RegExp(r'[0-9]'));
  //   bool isLowercase = passwordController!.text.contains(RegExp(r'[a-z]'));
  //   bool isUppercase = passwordController!.text.contains(RegExp(r'[A-Z]'));
  //   bool isSpecialChar =
  //       passwordController!.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  //   return isNumber && isLowercase && isUppercase && isSpecialChar;
  // }

  // bool? validateConfirmPasswords(BuildContext context, String password,
  //     {String? confirmPassword}) {
  //   if (confirmPassword != password) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(14.r),
  //           topRight: Radius.circular(14.r),
  //         )),
  //         backgroundColor: Colors.red,
  //         content: Text(
  //           'Passwords do not match',
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       ),
  //     );
  //     return false;
  //   } else if (confirmPassword!.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(14.r),
  //           topRight: Radius.circular(14.r),
  //         )),
  //         backgroundColor: Colors.red,
  //         content: Text(
  //           'Please confirm your password',
  //           style: TextStyle(color: Colors.black),
  //         ),
  //       ),
  //     );
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  SignUpState copyWith({
    GlobalKey<FormState>? emailFormKey,
    GlobalKey<FormState>? passwordFormKey,
    GlobalKey<FormState>? confirmPasswordFormKey,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? nameController,
    TextEditingController? confirmPasswordController,
    TextEditingController? validationCodeController,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    bool? policyAgreement,
    bool? isLoading,
    String? Function(String?)? emailValidator,
    String? Function(String?)? passwordValidator,
  }) {
    return SignUpState(
      validationCodeController:
          validationCodeController ?? this.validationCodeController,
      emailFormKey: emailFormKey ?? this.emailFormKey,
      passwordFormKey: passwordFormKey ?? this.passwordFormKey,
      confirmPasswordFormKey:
          confirmPasswordFormKey ?? this.confirmPasswordFormKey,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          passwordController ?? this.confirmPasswordController,
      emailController: emailController ?? this.emailController,
      userNameController: nameController ?? this.userNameController,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword:
          obscureConfirmPassword ?? this.obscureConfirmPassword,
      policyAgreement: policyAgreement ?? this.policyAgreement,
      isLoading: isLoading ?? this.isLoading,
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
    );
  }

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        obscurePassword,
        obscureConfirmPassword,
        validationCodeController,
        policyAgreement,
        isLoading,
        emailValidator,
        passwordValidator,
      ];
}
