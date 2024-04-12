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
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'appbarlogo',
                  child: Image.asset(
                    AssetPath.icon,
                    width: 30.w,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Audio Diary")
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.bell),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: CustomRouter.shell!,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: CustomRouter.shell!.currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart), label: "Following"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: "My"),
        ],
        onTap: (index) => CustomRouter.shell!.goBranch(index),
      ),
    );
  }
}
