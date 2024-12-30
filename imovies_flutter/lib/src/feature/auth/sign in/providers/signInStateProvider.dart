// ignore_for_file: avoid_print, use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifiers, implicit_call_tearoffs, unused_element, depend_on_referenced_packages, implementation_imports, library_prefixes
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart'
    as formFieldValidatorPackage;
import 'package:imovies_flutter/src/feature/auth/sign%20in/providers/signInState.dart';
import 'package:imovies_flutter/src/feature/auth/validation/pages/validation.screen.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/customSnackbar/customSnackbar.widget.dart';
import 'package:imovies_flutter/src/core/utils/api_client.dart';
import 'package:imovies_flutter/src/core/utils/singletons.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signInStateProvider.g.dart';

@riverpod
class SignInStateNotifier extends _$SignInStateNotifier {
  @override
  SignInState build() {
    return SignInState(
      emailFormKey: GlobalKey<FormState>(),
      emailResetFormKey: GlobalKey<FormState>(),
      passwordFormKey: GlobalKey<FormState>(),
      passwordResetFormKey: GlobalKey<FormState>(),
      passwordController: TextEditingController(),
      emailController: TextEditingController(),
      validationCodeController: TextEditingController(),
      isLoading: false,
      obscurePassword: true,
      rememberMe: false,
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
    );
  }

  obscurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword!);
  }

  updateState(SignInState updatedState) {
    state = updatedState;
  }

  // String getUserName() => state.userNameController!.text.trim().toLowerCase();
  String _getEmail() => state.emailController!.text.trim().toLowerCase();
  String _getPassword() => state.passwordController!.text.trim();
  String _getValidationCode() => state.validationCodeController!.text.trim();

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
  rememberMe() {
    state = state.copyWith(rememberMe: !state.rememberMe!);
  }

  ///
  Future<void> signInWithEmail(
      BuildContext context, VoidCallback onSignedIn) async {
    setIsLoadingToTrue();
    Future.delayed(Duration(seconds: 2));
    final sp = await SharedPreferences.getInstance();
    final caller = singleton<ApiClient>().client.modules.auth;
    final emailAuth = EmailAuthController(caller);

    final email = _getEmail();
    final password = _getPassword();
    print('SIGN IN PASS IS: $password');
    if (!EmailValidator.validate(email)) {
      customSnackBar(
        context,
        'Invalid email',
        // bgColor: Color(0xffD92226),
      );
      setIsLoadingToFalse();
      return;
    }

    var result = await emailAuth.signIn(email, password);
    sp.setString('email', email);
    // sp.setBool('isLoggedIn', result);
    print('::::::::::$result');
    if (result == null) {
      customSnackBar(
        context,
        // 'Error! Check connection',
        'Wrong password',
        // bgColor: Colors.black,

        // Color(0xffD92226),
      );
      setIsLoadingToFalse();
      return;
    }

    onSignedIn();
    context.push('/home');
    setIsLoadingToFalse();
  }

  ///
  Future<void> initiatePasswordReset(
    BuildContext context,
  ) async {
    setIsLoadingToTrue();
    final caller = singleton<ApiClient>().client.modules.auth;
    final emailAuth = EmailAuthController(caller);
    final email = _getEmail();

    if (!EmailValidator.validate(email)) {
      customSnackBar(
        context,
        'Invalid email',
        // bgColor: Color(0xffD92226),
      );
      setIsLoadingToFalse();
      return;
    }

    final response = await emailAuth.initiatePasswordReset(email);
    if (response == false) {
      customSnackBar(context, '''User doesn't exist''');
    } else {
      context.push('/passwordReset');
    }
    setIsLoadingToFalse();
  }

  ///
  Future<void> resetPassword(
      BuildContext context, VoidCallback onSignedIn) async {
    setIsLoadingToTrue();
    final caller = singleton<ApiClient>().client.modules.auth;
    final emailAuth = EmailAuthController(caller);
    final validationCode = _getValidationCode();
    final email = _getEmail();
    final password = _getPassword();

    var success =
        await emailAuth.resetPassword(email, validationCode, password);
    print('RESET PASS IS: $password');
    if (!success) {
      customSnackBar(
        context,
        'Verification code is invalid!',
        // bgColor: Color(0xffD92226),
      );
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
