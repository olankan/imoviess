import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/feature/components/constants.dart';
import 'package:imovies_flutter/src/feature/screens/auth/sign%20in/pages/signin.screen.dart';
import 'package:imovies_flutter/src/feature/widgets/custom_container/custom_container.widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SigninScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/gifs/sign_up_background.gif',
              fit: BoxFit.cover,
            ),
          ),
          CustomContainer(
            backgroundColor: Colors.black.withOpacity(0.8),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero( 
                        tag: 'logo',
                        child: Image.asset(
                          'assets/images/movie-logo.jpg',
                          height: 50.h,
                        ),
                      )
                          .animate()
                          .fade(delay: Duration(milliseconds: 500))
                          .slide(delay: Duration(milliseconds: 500)),
                      Text(
                        'i',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontFamily: fontFamily,
                          // fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn(delay: Duration(milliseconds: 200)),
                      Image.asset(
                        'assets/images/movies.jpg',
                        height: 30.h,
                      ).animate().flip(delay: Duration(milliseconds: 500)),
                      20.horizontalSpace
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
