import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constant/assets_file_path.dart';
import '../../common/controller/bottom_audio_bar.dart';
import '../../common/widget/appbar/appbar.dart';
import '../../common/widget/category/category_list.dart';
import '../../common/widget/feed/audio_bar.dart';
import '../../common/widget/feed/feed.dart';

class FollowingScreen extends ConsumerWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showAudioBar = ref.watch(showAudioBarProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ADAppBar(
                title: 'Following',
              ),
              const CategoryList(),
              Expanded(
                child: SizedBox(
                  child: ListView(
                    children: [
                      Feed(
                        nickName: "inflearn",
                        imgPath: AssetPath.icon,
                        title: "당장 실무 투입이 가능한 완벽한 플러터 개발자 되는 법! 로드맵",
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
                        nickName: "cody yun",
                        imgPath: AssetPath.icon,
                        title: "플러터가 다른 크로스 플랫폼보다 더 강력한 이유 - 요즘IT",
                        thumbnailPath: AssetPath.appBarLogo,
                      ),
                      Feed(
                        nickName: "nomad coder",
                        imgPath: AssetPath.icon,
                        title: "[니꼬쌤이 가르치면 달라 - 40만 유튜버랑 웹 개발 시작하기",
                        thumbnailPath: AssetPath.appBarLogo,
                      ),
                      Feed(
                        nickName: "Naver",
                        imgPath: AssetPath.icon,
                        title: "지식iN 앱을 Flutter로 개발하는 이유 - NAVER D2 - 네이버",
                        thumbnailPath: AssetPath.appBarLogo,
                      ),
                    ],
                  ),
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
