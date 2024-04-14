import 'package:auda/core/constant/assets_file_path.dart';
import 'package:auda/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyUserInfo extends StatelessWidget {
  const MyUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32.h,
            backgroundImage: Image.asset(AssetPath.icon).image,
          ),
          SizedBox(width: 20.w),
          SizedBox(
            width: 180.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Jinpyo",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("kjp00552277@gmail.com"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColor.mainColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text("Follower 121"),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomColor.mainColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text("Following 98"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
