import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovies_flutter/src/core/shared/presentation/providers/sharedProviders.dart';
import 'package:imovies_flutter/src/feature/home/presentation/Widgets/IconData/iconData.widget.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/pages/movieCategories/movieCategories.export.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    required this.selectedNavIndex,
  });

  final int selectedNavIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onPressedRef = ref.watch(onPressedProvider);
    return Container(
      height: 90.h,
      width: 390.w,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(90), topRight: Radius.circular(90)),
          color: Colors.black.withOpacity(0.4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            BottomBarIconData.untappedIcons.length,
            (index) => GestureDetector(
              onTap: () {
                ref.watch(movieIndexProvider.notifier).state = 0;
                ref.watch(navIndex.notifier).state = index;
                ref.watch(onPressedProvider.notifier).state = !onPressedRef;
              },
              child: Icon(
                selectedNavIndex == index
                    ? BottomBarIconData.tappedIcons[index]
                    : BottomBarIconData.untappedIcons[index],
                size: 30.r,
                color: selectedNavIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
