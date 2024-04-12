import 'dart:developer';

import 'package:auda/core/constant/assets_file_path.dart';
import 'package:auda/presentation/common/controller/bottom_audio_bar.dart';
import 'package:auda/presentation/common/widget/feed/audio_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widget/category/category_list.dart';
import '../../common/widget/feed/feed.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showAudioBar = ref.watch(showAudioBarProvider);
    log('HomeScreen Rebuild', name: 'Rebuild');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CategoryList(),
              SizedBox(
                width: 320.w,
                height: 490.h,
                child: ListView(
                  children: [
                    Feed(
                      nickName: "jinpyo",
                      imgPath: AssetPath.icon,
                      title:
                          "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
                      thumbnailPath: AssetPath.appBarLogo,
                    ),
                    Feed(
                      nickName: "jinpyo",
                      imgPath: AssetPath.icon,
                      title:
                          "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
                      thumbnailPath: AssetPath.appBarLogo,
                    ),
                    Feed(
                      nickName: "jinpyo",
                      imgPath: AssetPath.icon,
                      title:
                          "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
                      thumbnailPath: AssetPath.appBarLogo,
                    ),
                    Feed(
                      nickName: "jinpyo",
                      imgPath: AssetPath.icon,
                      title:
                          "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
                      thumbnailPath: AssetPath.appBarLogo,
                    ),
                    Feed(
                      nickName: "jinpyo",
                      imgPath: AssetPath.icon,
                      title:
                          "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
                      thumbnailPath: AssetPath.appBarLogo,
                    ),
                  ],
                ),
              )
            ],
          ),
          if (showAudioBar)
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomAudioBar(),
            ).animate().slideY(begin: 0.1),
        ],
      ),
    );
  }
}
