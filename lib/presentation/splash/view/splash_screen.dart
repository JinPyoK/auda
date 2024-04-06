import 'package:auda/core/constant/assets_file_path.dart';
import 'package:auda/presentation/splash/controller/splash_preprocess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150.w,
          height: 100.h,
          child: Hero(
            tag: "appbarlogo",
            child: Image.asset(
              AssetPath.appBarLogo,
            )
                .animate(
                  onComplete: (_) => pushLoginScreen(context),
                )
                .fadeIn(duration: const Duration(seconds: 2))
                .then()
                .shimmer(
                  color: Colors.white,
                  duration: const Duration(seconds: 2),
                ),
          ),
        ),
      ),
    );
  }
}
