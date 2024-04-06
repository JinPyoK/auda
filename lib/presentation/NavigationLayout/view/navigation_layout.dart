import 'package:auda/core/constant/assets_file_path.dart';
import 'package:auda/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'appbarlogo',
          child: Image.asset(
            AssetPath.appBarLogo,
            width: 80.w,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: CustomRouter.shell!,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: CustomRouter.shell!.currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: "home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.info), label: "my"),
        ],
        onTap: (index) => CustomRouter.shell!.goBranch(index),
      ),
    );
  }
}
