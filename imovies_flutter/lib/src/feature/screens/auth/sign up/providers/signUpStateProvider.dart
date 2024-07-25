// ignore_for_file: avoid_print, use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifiers, implicit_call_tearoffs, unused_element, depend_on_referenced_packages, implementation_imports, library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart'
    as formFieldValidatorPackage;
import 'package:imovies_flutter/src/feature/screens/auth/sign%20up/providers/signUpState.dart';
import 'package:imovies_flutter/src/feature/widgets/custom_text_field/showSnackbar/showSnackbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_client/src/protocol/client.dart';
import 'package:email_validator/email_validator.dart';

part 'signUpStateProvider.g.dart';

@riverpod
class SignUpStateNotifier extends _$SignUpStateNotifier {
  @override
  SignUpState build() {
    return SignUpState(
      emailFormKey: GlobalKey<FormState>(),
      passwordFormKey: GlobalKey<FormState>(),
      confirmPasswordFormKey: GlobalKey<FormState>(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      userNameController: TextEditingController(),
      emailController: TextEditingController(),
      isLoading: false,
      emailValidator: formFieldValidatorPackage.EmailValidator(
          errorText: 'enter a valid email address'),
      passwordValidator: formFieldValidatorPackage.MultiValidator([
        formFieldValidatorPackage.RequiredValidator(
            errorText: 'password is required'),
        formFieldValidatorPackage.MinLengthValidator(8,
            errorText: 'password must be at least 8 characters long'),
        formFieldValidatorPackage.PatternValidator(r'(?=.*?[#?!@$%^&*-])',
            errorText: 'passwords must have at least one special character'),
        formFieldValidatorPackage.PatternValidator(r'(?=.*?[0-9])',
            errorText: 'passwords must have at least one number'),
        formFieldValidatorPackage.PatternValidator(r'(?=.*?[A-Z])',
            errorText: 'passwords must have at least one uppercase letter'),
        formFieldValidatorPackage.PatternValidator(r'(?=.*?[a-z])',
            errorText: 'passwords must have at least one lowercase letter'),
      ]),
      obscurePassword: true,
      obscureConfirmPassword: true,
      policyAgreement: false,
    );
  }

  String getUserName() => state.userNameController!.text.trim().toLowerCase();
  String getEmail() => state.emailController!.text.trim().toLowerCase();
  String getPassword() => state.passwordController!.text.trim().toLowerCase();
  String getValidationCode() => state.validationCodeController!.text.trim();

  ///
  obscurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword!);
  }

  ///
  void setIsLoadingToTrue() {
    if (state.isLoading == false) {
      state = state.copyWith(isLoading: true);
    }
  }

  ///
  void setIsLoadingToFalse() {
    if (state.isLoading == true) {
      state = state.copyWith(isLoading: false);
    }
  }

  ///
  obscureConfirmPassword() {
    state =
        state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword!);
  }

  ///
  policyAgreement() {
    state = state.copyWith(policyAgreement: !state.policyAgreement!);
  }

  ///
  Future<void> _signUpWithEmail(Caller caller) async {
    setIsLoadingToTrue();
    final emailAuth = EmailAuthController(caller);
    final userName = getUserName();
    final email = getEmail();
    final password = getPassword();

    await emailAuth.createAccountRequest(userName, email, password);
    setIsLoadingToFalse();
  }

  ///
  Future<void> _signInWithEmail(
      BuildContext context, Caller caller, VoidCallback onSignedIn) async {
    setIsLoadingToTrue();
    final emailAuth = EmailAuthController(caller);
    final email = getEmail();
    final password = getPassword();

    if (!EmailValidator.validate(email)) {
      showSnackBar(context, 'Invalid email', color: Colors.red);
      setIsLoadingToFalse();
      return;
    }

    var result = await emailAuth.signIn(email, password);
    if (result == null) {
      showSnackBar(context, 'Wrong password', color: Colors.red);
      setIsLoadingToFalse();
      return;
    }

    onSignedIn();
    setIsLoadingToFalse();
  }

  ///
  Future<void> _validateAccount(
      BuildContext context, Caller caller, VoidCallback onSignedIn) async {
    setIsLoadingToTrue();
    final emailAuth = EmailAuthController(caller);
    final validationCode = getValidationCode();
    final email = getEmail();
    final password = getPassword();

    if (validationCode.isEmpty) {
      showSnackBar(context, 'Enter your code', color: Colors.red);
      setIsLoadingToFalse();
      return;
    }

    var userInfo = await emailAuth.validateAccount(email, validationCode);

    if (userInfo == null) {
      showSnackBar(context, 'Incorrect code', color: Colors.red);
      setIsLoadingToFalse();
      return;
    }

    var result = await emailAuth.signIn(email, password);
    if (result == null) {
      // Handle sign-in failure
      setIsLoadingToFalse();
      return;
    }

    onSignedIn();
    setIsLoadingToFalse();
  }

  ///
  Future<void> _initiatePasswordReset(
      BuildContext context, Caller caller) async {
    setIsLoadingToTrue();
    final emailAuth = EmailAuthController(caller);
    final email = getEmail();

    if (!EmailValidator.validate(email)) {
      showSnackBar(context, 'Invalid email', color: Colors.red);
      setIsLoadingToFalse();
      return;
    }

    await emailAuth.initiatePasswordReset(email);
    setIsLoadingToFalse();
  }

  ///
  Future<void> _resetPassword(
      BuildContext context, Caller caller, VoidCallback onSignedIn) async {
    setIsLoadingToTrue();
    final emailAuth = EmailAuthController(caller);
    final validationCode = getValidationCode();
    final email = getEmail();
    final password = getPassword();

    var success =
        await emailAuth.resetPassword(email, validationCode, password);

    if (!success) {
      showSnackBar(context, 'Incorrect code', color: Colors.red);
      setIsLoadingToFalse();
      return;
    }

    var result = await emailAuth.signIn(email, password);
    if (result == null) {
      // Handle sign-in failure
      setIsLoadingToFalse();
      return;
    }

    onSignedIn();
    setIsLoadingToFalse();
  }
}

final policyAgreementProvider = StateProvider<bool>((ref) => false);
final rememberMeProvider = StateProvider<bool>((ref) => false);
