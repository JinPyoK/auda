import 'package:auda/presentation/common/controller/bottom_audio_bar.dart';
import 'package:auda/presentation/my/widget/my_user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widget/feed/audio_bar.dart';
import '../widget/my_tab_view.dart';

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool showAudioBar = ref.watch(showAudioBarProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Stack(
        children: [
          const Column(
            children: [
              MyUserInfo(),
              Expanded(child: SizedBox(child: MyUserTabView())),
            ],
          ),
          if (showAudioBar)
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomAudioBar(),
            ).animate().slideY(begin: 0.1, curve: Curves.linearToEaseOut),
        ],
      ),
    );
  }
}
