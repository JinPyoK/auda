import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserUI extends StatelessWidget {
  const UserUI({
    super.key,
    required this.nickName,
    required this.imgPath,
  });

  final String nickName;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircleAvatar(backgroundImage: Image.asset(imgPath).image)),
        SizedBox(
          width: 5.w,
        ),
        Text(
          nickName,
          style: TextStyle(fontSize: 10.sp),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
