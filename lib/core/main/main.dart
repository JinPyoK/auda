import 'package:auda/core/constant/custom_theme.dart';
import 'package:auda/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Auda());
}

class Auda extends StatelessWidget {
  const Auda({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(320, 720),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: customTheme,
        routerConfig: CustomRouter.router,
      ),
    );
  }
}
