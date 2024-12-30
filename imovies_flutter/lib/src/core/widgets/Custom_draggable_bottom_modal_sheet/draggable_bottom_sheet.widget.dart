import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDraggableModalBottomSheet extends StatefulWidget {
  const CustomDraggableModalBottomSheet(
      {super.key,
      required this.chidWidget,
      required this.ctxt,
      this.initialChildSize});
  final Widget chidWidget;
  final double? initialChildSize;
  final BuildContext ctxt;

  @override
  State<CustomDraggableModalBottomSheet> createState() =>
      _CustomDraggableModalBottomSheetState();
}

class _CustomDraggableModalBottomSheetState
    extends State<CustomDraggableModalBottomSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);
  void anchor() => animateSheet(getSheet.snapSizes!.last);
  void expand() => animateSheet(getSheet.maxChildSize);
  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(size,
        duration: const Duration(microseconds: 60), curve: Curves.easeInOut);
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (widge, constraints) => DraggableScrollableSheet(
          key: sheet,
          initialChildSize: widget.initialChildSize ?? 0.37,
          maxChildSize: 0.9,
          minChildSize: 0.30,
          expand: true,
          snap: true,
          snapSizes: const [0.3, 0.5, 0.7],
          builder: (BuildContext builder, ScrollController dController) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.8, sigmaY: 2.8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                child: CustomScrollView(
                  controller: dController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                        child: Container(
                          width: 40.w,
                          height: 4.h,
                          margin: EdgeInsets.symmetric(vertical: 8.r),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [widget.chidWidget],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
