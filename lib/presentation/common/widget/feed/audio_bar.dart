import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomAudioBar extends StatelessWidget {
  const BottomAudioBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0x7799d5ff),
      ),
    );
  }
}
