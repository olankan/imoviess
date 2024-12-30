import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/Routes/goRouter.dart'; 
import 'package:imovies_flutter/src/core/utils/singletons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        // designSize: const Size(392.73, 781),
        designSize: const Size(430, 930),
        builder: (context, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
              routerConfig: router,
            title: 'Serverpod Demo',
            theme: ThemeData(
                primarySwatch: Colors.grey,
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.grey,
                  brightness: Brightness.dark,
                )),
        ));
  }
}
