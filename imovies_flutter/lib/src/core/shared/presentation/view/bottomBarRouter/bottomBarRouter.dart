import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/shared/presentation/providers/sharedProviders.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view/bottomNavBar/bottomNavBar.dart';
import 'package:imovies_flutter/src/feature/home/presentation/pages/home.screen.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/pages/movieCategories/movieCategories.dart';
import 'package:imovies_flutter/src/feature/settings/settings.dart';

class BottomNavBarRouter extends ConsumerWidget {
  const BottomNavBarRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNavIndex = ref.watch(navIndex);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          selectedNavIndex == 1
              ? const MovieCategoriesScreen()
              : selectedNavIndex == 0
                  ? const HomeNew()
                  : SettingsScreen(),
          // const ProfilePage(),
          Positioned(
            top: 860.h,
            left: 20.w,
            child: BottomNavBar(selectedNavIndex: selectedNavIndex),
          ),
        ],
      ),
    );
  }
}
