import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ADAppBar extends StatelessWidget {
  const ADAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 12.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
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
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.pencil),
            ),
          ],
        )
      ],
    );
  }
}
