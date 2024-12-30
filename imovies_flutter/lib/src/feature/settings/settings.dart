import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/customContainer/customContainer.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/customSnackbar/customSnackbar.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/feature/auth/sign%20up/providers/signUpStateProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username =
        ref.watch(signUpStateNotifierProvider).userNameController!.text;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.settings),
                  username.isEmpty
                      ? Text(
                          '',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Hi $username',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                  SizedBox()
                ],
              ),
              80.verticalSpace,
              CustomContainer(
                borderColor: Colors.grey,
                radius: 90.r,
                height: 150.h,
                width: 150.w,
                child: Center(
                    child: Icon(
                  Icons.person,
                  size: 120.r,
                  color: Colors.black,
                )),
              ),
              30.verticalSpace,
              SettingsButton(
                title: 'Change Password',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SettingsDialog(
                            title: 'Password',
                          ));
                },
              ),
              10.verticalSpace,
              SettingsButton(
                title: 'Update Email',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SettingsDialog(
                            title: 'Email',
                          ));
                },
              ),
              10.verticalSpace,
              SettingsButton(
                title: 'Update Username',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SettingsDialog(
                            title: 'Username',
                          ));
                },
              ),
              10.verticalSpace,
              SettingsButton(
                icon: Icons.logout_outlined,
                title: 'Log out',
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('email');
                  context.go('/signIn');
                },
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({
    super.key,
    this.title,
  });

  final title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainer(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        radius: 20.r,
        height: 200.h,
        width: 350.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update $title',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            10.verticalSpace,
            CustomTextFormField.emailAddress(
              hintText: 'e.g. $title',
            ),
            20.verticalSpace,
            Align(
                alignment: Alignment.centerRight,
                child: CustomContainer(
                    radius: 10.r,
                    height: 40.h,
                    width: 120.w,
                    onTap: () {
                      customSnackBar(context, 'Updated successfully');
                      context.pop();
                    },
                    child: Center(
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
  });

  final String title;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: Colors.white.withOpacity(0.05),
      height: 70.h,
      borderColor: Colors.grey,
      width: double.infinity,
      radius: 15.r,
      onTap: onTap,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          10.horizontalSpace,
          Icon(icon ?? Icons.edit_calendar_outlined),
          10.horizontalSpace,
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
