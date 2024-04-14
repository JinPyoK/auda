import 'package:auda/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10.0),
        child: AppBar(
          backgroundColor: Colors.white,
        ),
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
