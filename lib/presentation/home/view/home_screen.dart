import 'package:auda/core/constant/assets_file_path.dart';
import 'package:flutter/material.dart';

import '../../common/widget/category/category_list.dart';
import '../../common/widget/feed/feed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CategoryList(),
          Feed(
            nickName: "jinpyo",
            imgPath: AssetPath.icon,
            title: "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
            thumbnailPath: AssetPath.appBarLogo,
          ),
          Feed(
            nickName: "jinpyo",
            imgPath: AssetPath.icon,
            title: "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
            thumbnailPath: AssetPath.appBarLogo,
          ),
          Feed(
            nickName: "jinpyo",
            imgPath: AssetPath.icon,
            title: "[flutter] 벡터이미지(SVG) 파일 다루기 2탄 - svg image provider",
            thumbnailPath: AssetPath.appBarLogo,
          ),
        ],
      ),
    );
  }
}
