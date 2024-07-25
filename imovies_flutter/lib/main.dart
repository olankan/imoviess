import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/feature/screens/splash_screen/splash.screen.dart';
import 'package:imovies_flutter/src/utils/singletons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await initSingletons();
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.73, 781),
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Serverpod Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blueGrey,
                  brightness: Brightness.dark,
                )),
            home: SplashScreen()));
  }
}
