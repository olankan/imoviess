import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view%20models/movie%20credits%20vm/movieCredits.vm.dart';
 
class CrewCharacter extends StatelessWidget {
  const CrewCharacter({
    super.key,
    required this.credit,
  });

  final MovieCreditsVm credit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120.w,
        child: credit.crewJob == '' || credit.crewJob == null
            ? Text(
                '(Extra)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            : Text(
                '(${credit.crewJob!})',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ));
  }
}
