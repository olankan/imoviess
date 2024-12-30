// ignore_for_file: avoid_print, use_build_context_synchronously, unused_local_variable, no_leading_underscores_for_local_identifiers, implicit_call_tearoffs, unused_element, depend_on_referenced_packages, implementation_imports, library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart'
    as formFieldValidatorPackage;
import 'package:imovies_flutter/src/feature/auth/sign%20up/providers/signUpState.dart';
import 'package:imovies_flutter/src/feature/auth/validation/pages/validation.screen.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/customSnackbar/customSnackbar.widget.dart';
import 'package:imovies_flutter/src/core/utils/api_client.dart';
import 'package:imovies_flutter/src/core/utils/singletons.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_client/src/protocol/client.dart';
import 'package:email_validator/email_validator.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signUpStateProvider.g.dart';

@riverpod
class SignUpStateNotifier extends _$SignUpStateNotifier {
  @override
  SignUpState build() {
    return SignUpState(
      emailFormKey: GlobalKey<FormState>(),
      passwordFormKey: GlobalKey<FormState>(),
      confirmPasswordFormKey: GlobalKey<FormState>(),
      validationCodeFormKey: GlobalKey<FormState>(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      validationCodeController: TextEditingController(),
      userNameController: TextEditingController(text: 'No name'),
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

  String _getUserName() => state.userNameController!.text.trim();
  String _getEmail() => state.emailController!.text.trim().toLowerCase();
  String _getPassword() => state.passwordController!.text.trim();
  String _getValidationCode() => state.validationCodeController!.text.trim();

  ///
  obscurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword!);
  }

  ///
  updateState(SignUpState updatedState) {
    state = updatedState;
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
  Future<void> signUpWithEmail(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    setIsLoadingToTrue();
    final caller = singleton<ApiClient>().client.modules.auth;
    final emailAuth = EmailAuthController(caller);
    final userName = _getUserName();
    final email = _getEmail();
    final password = _getPassword();

    final response =
        await emailAuth.createAccountRequest(userName, email, password);
    sp.setString('email', email);
    sp.setBool('isLoggedIn', response);
    // context.push('/validationScreen');
    if (response == true) {
      context.push('/validationScreen');
    } else {
      customSnackBar(context, 'Account already exists!');
    }
    setIsLoadingToFalse();
  }

  ///
  Future<void> validateAccount(BuildContext context,
      {VoidCallback? onSignedIn}) async {
    setIsLoadingToTrue();

    final caller = singleton<ApiClient>().client.modules.auth;
    final emailAuth = EmailAuthController(caller);

    final validationCode = _getValidationCode();

    final email = _getEmail();
    final password = _getPassword();

    if (validationCode.isEmpty) {
      customSnackBar(
        context,
        'Enter your code',
        bgColor: Color(0xffD92226),
      );

      setIsLoadingToFalse();
      return;
    }

    var userInfo = await emailAuth.validateAccount(email, validationCode);

    if (userInfo == null) {
      customSnackBar(
        context,
        'Incorrect code',
        bgColor: Color(0xffD92226),
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
    customSnackBar(context, 'Account created Succesfully!');
    onSignedIn!();

    setIsLoadingToFalse();
  }
}
