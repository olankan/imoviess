// ignore_for_file: avoid_print, use_build_context_synchronously, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, implicit_call_tearoffs

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:serverpod_auth_client/src/protocol/client.dart';
import 'package:imovies_flutter/src/feature/screens/auth/sign%20in/providers/signInState.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

part 'signInStateProvider.g.dart';

@riverpod
class SignInStateNotifier extends _$SignInStateNotifier {
  @override
  SignInState build() {
    return SignInState(
      emailFormKey: GlobalKey<FormState>(),
      passwordFormKey: GlobalKey<FormState>(),
      passwordController: TextEditingController(),
      emailController: TextEditingController(),
      isLoading: false,
      obscurePassword: true,
      rememberMe: false,
      emailValidator: EmailValidator(errorText: 'enter a valid email address'),
      passwordValidator: MultiValidator([
        RequiredValidator(errorText: 'password is required'),
        MinLengthValidator(8,
            errorText: 'password must be at least 8 characters long'),
        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
            errorText: 'passwords must have at least one special character'),
        PatternValidator(r'(?=.*?[0-9])',
            errorText: 'passwords must have at least one number'),
        PatternValidator(r'(?=.*?[A-Z])',
            errorText: 'passwords must have at least one uppercase letter'),
        PatternValidator(r'(?=.*?[a-z])',
            errorText: 'passwords must have at least one lowercase letter'),
      ]),
    );
  }

  obscurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword!);
  }

  Future<void> _signInWithEmail(
      String email, String password, Caller caller) async {
    // // Create a Serverpod client
    // var client = Client(
    //   'http://$localhost:8080/',
    //   authenticationKeyManager: FlutterAuthenticationKeyManager(),
    // )..connectivityMonitor = FlutterConnectivityMonitor();

    late final EmailAuthController _emailAuth;
    _emailAuth = EmailAuthController(caller);
  }

  // Future<void> initializeEmail() async {
  //   final email = await prefEmail(); // Wait for the email retrieval
  //   state = state.copyWith(emailController: TextEditingController(text: email));
  // }

  // Future<String> prefEmail() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('email') ?? '';
  // }

  // obscurePassword() {
  //   state = state.copyWith(obscurePassword: !state.obscurePassword!);
  // }

  // obscureConfirmPassword() {
  //   state =
  //       state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword!);
  // }

  // Future<void> signIn(BuildContext context) async {
  //   state = state.copyWith(isLoading: true);
  //   final prefs = await SharedPreferences.getInstance();
  //   final googleToken = prefs.getString('googleToken');
  //   if (googleToken != null) {
  //     await prefs.remove('googleToken');
  //   }
  //   try {
  //     final response = await _apiService.post(url: '/sign-in', data: {
  //       "email": state.emailController!.text.toString(),
  //       "password": state.passwordController!.text.toString(),
  //     });
  //     // print('::::::respone is loading ==== ${state.isLoading}');
  //     if (response != null &&
  //         (response.statusCode == 200 || response.statusCode == 201)) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: AppColors.yellow,
  //           content: Text(
  //             'Sign in successful',
  //             style: TextStyle(color: AppColors.black),
  //           ),
  //         ),
  //       );
  //       state = state.copyWith(isLoading: false);

  //       final token = response.data['token'];
  //       final email = response.data['email'];
  //       // Store token and user ID using shared_preferences
  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('token', token!);
  //       await prefs.setString('email', email!);

  //       context.go('/dashboard');
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           backgroundColor: AppColors.red,
  //           content: Text(
  //             'Invalid email or password.',
  //             style: TextStyle(color: AppColors.black),
  //           ),
  //         ),
  //       );
  //       // Handle other status codes or display an error message
  //       throw Exception('Failed to sign in');
  //     }
  //   } catch (error) {
  //     print('General6666666 error: $error');
  //     String? responseDataMsg; // Define responseDataMsg outside the if block
  //     if (error is DioException) {
  //       if (error.response != null) {
  //         responseDataMsg = error.response!.data['msg'];
  //       }
  //     }

  //     state = state.copyWith(isLoading: false);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: AppColors.red,
  //         content: Text(
  //           'Check your connection.',
  //           style: TextStyle(color: AppColors.black),
  //         ),
  //       ),
  //     );
  //   }
  // }

  // Future<void> signOut(BuildContext context) async {
  //   state = state.copyWith(isLoading: true);
  //   Future.delayed(const Duration(seconds: 2), () {
  //     state = state.copyWith(isLoading: false);
  //     print('SIGNOUT TRIGGERED');
  //     context.go('/signin');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: AppColors.yellow,
  //         content: Text(
  //           'Signed out Successfully',
  //           style: TextStyle(color: AppColors.black),
  //         ),
  //       ),
  //     );
  //   });
  // }

  // Future<void> signInWithGoogle(BuildContext context) async {
  //   state = state.copyWith(isLoading: true);
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //   if (token != null) {
  //     await prefs.remove('token');
  //   }
  //   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ]);

  //   try {
  //     final GoogleSignInAccount? currentUser = await _googleSignIn.signIn();
  //     if (currentUser == null) {
  //       state = state.copyWith(isLoading: false);
  //       return;
  //     }

  //     // Access user information
  //     final googleName = currentUser.displayName;
  //     final googleEmail = currentUser.email;
  //     print(googleEmail);
  //     print(googleName);

  //     // Perform additional actions after successful sign-in
  //     final response = await _apiService.post(url: '/auth_sign_in', data: {
  //       "name": googleName,
  //       "email": googleEmail,
  //     });

  //     print(response);
  //     state = state.copyWith(isLoading: true);
  //     if (response != null) {
  //       final googleSignInToken = response.data['token'];
  //       await prefs.setString('googleToken', googleSignInToken!);
  //       print('TOKEN SAVED SUCCESSFULLY: $googleSignInToken');
  //     }

  //     ///
  //     print('signed in user is $currentUser');

  //     ///
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: AppColors.yellow,
  //         content: Text(
  //           'Sign in successful',
  //           style: TextStyle(color: AppColors.black),
  //         ),
  //       ),
  //     );
  //     state = state.copyWith(isLoading: false);
  //     // Navigate to dashboard
  //     context.go('/dashboard');
  //   } catch (e) {
  //     // Handle errors
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: AppColors.red,
  //         content: Text(
  //           'Sign in failed. Please try again later.',
  //           style: TextStyle(color: AppColors.black),
  //         ),
  //       ),
  //     );
  //     state = state.copyWith(isLoading: false);
  //     rethrow;
  //   }
  // }

  // Future<void> checkAndSignOutGoogleUser(BuildContext context) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // Retrieve the value of the 'token' preference
  //   final String? token = prefs.getString('token');
  //   final String? googleToken = prefs.getString('googleToken');
  //   if (token != null || googleToken != null) {
  //     // If the token is not empty, clear it
  //     prefs.remove('token');
  //     prefs.remove('googleToken');
  //     print('Cleared token preference');
  //   } else {
  //     print('Token preference is already empty');
  //   }

  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   // Listen for sign-in/sign-out events
  //   googleSignIn.onCurrentUserChanged
  //       .listen((GoogleSignInAccount? account) async {
  //     if (account == null) {
  //       // User signed out
  //       print('No signed-in Google user');
  //       context.go('/signin');
  //     } else {
  //       // User signed in
  //       print('Signed in Google user: ${account.email}');
  //     }
  //   });

  //   // Check the current user
  //   if (googleSignIn.currentUser == null) {
  //     print('No signed-in Google user');
  //     context.go('/signin');
  //   } else {
  //     print('Signed in Google user: ${googleSignIn.currentUser!.email}');
  //   }

  //   // Sign out the current user
  //   try {
  //     await googleSignIn.signOut();
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: AppColors.yellow,
  //         content: Text(
  //           'Signed out successfully.',
  //           style: TextStyle(color: AppColors.black),
  //         ),
  //       ),
  //     );
  //     print('Signed out Google user');
  //   } catch (e) {
  //     print('Error signing out: $e');
  //     // Handle sign-out error gracefully
  //   }
}
