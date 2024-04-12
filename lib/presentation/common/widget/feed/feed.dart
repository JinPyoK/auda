import 'package:auda/presentation/common/controller/bottom_audio_bar.dart';
import 'package:auda/presentation/common/widget/user/user_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constant/colors.dart';

class Feed extends StatelessWidget {
  const Feed({
    super.key,
    required this.nickName,
    required this.imgPath,
    required this.title,
    this.thumbnailPath,
  });

  // User
  final String nickName;
  final String imgPath;

  // Title
  final String title;
  final String? thumbnailPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
          width: 320.w,
          height: 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Divider(
                color: CustomColor.thirdColor,
                thickness: 0.7,
              ),
              UserUI(
                nickName: nickName,
                imgPath: imgPath,
              ),
              SizedBox(height: 3.h),
              _MainTitle(
                title: title,
                thumbnailPath: thumbnailPath,
              ),
              const _FeedBottom(),
            ],
          )),
    );
  }
}

class _MainTitle extends StatelessWidget {
  const _MainTitle({
    required this.title,
    this.thumbnailPath,
  });

  final String title;
  final String? thumbnailPath;

  @override
  Widget build(BuildContext context) {
    final hasThumbnail = thumbnailPath != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: hasThumbnail ? 200.w : 270.w,
          height: 75.h,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            text: TextSpan(
              text: title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
              ),
            ),
          ),
        ),
        if (hasThumbnail)
          Image.asset(
            thumbnailPath!,
            width: 80.w,
            height: 60.h,
          ),
      ],
    );
  }
}

class _FeedBottom extends StatefulWidget {
  const _FeedBottom({super.key});

  @override
  State<_FeedBottom> createState() => _FeedBottomState();
}

class _FeedBottomState extends State<_FeedBottom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateTime.now().toString(),
          style: TextStyle(fontSize: 9.sp),
        ),
        Row(
          children: [
            _CustomFeedButton(
              backgroundColor: Colors.green.shade100,
              playIcon: const FaIcon(
                key: ValueKey<int>(1),
                FontAwesomeIcons.thumbsUp,
                color: Colors.white,
              ),
              notPlayIcon: FaIcon(
                key: const ValueKey<int>(2),
                FontAwesomeIcons.solidThumbsUp,
                color: Colors.green.shade500,
              ),
            ),
            SizedBox(width: 5.w),
            _CustomFeedButton(
              backgroundColor: Colors.pink.shade100,
              playIcon: const FaIcon(
                key: ValueKey<int>(1),
                FontAwesomeIcons.heart,
                color: Colors.white,
              ),
              notPlayIcon: FaIcon(
                key: const ValueKey<int>(2),
                FontAwesomeIcons.solidHeart,
                color: Colors.red.shade500,
              ),
            ),
            SizedBox(width: 5.w),
            const _CustomFeedButton(
              backgroundColor: CustomColor.thirdColor,
              playIcon: FaIcon(
                key: ValueKey<int>(1),
                FontAwesomeIcons.play,
                color: Colors.white,
              ),
              notPlayIcon: FaIcon(
                key: ValueKey<int>(1),
                FontAwesomeIcons.play,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _CustomFeedButton extends ConsumerStatefulWidget {
  const _CustomFeedButton({
    super.key,
    required this.backgroundColor,
    required this.playIcon,
    required this.notPlayIcon,
  });

  final Color backgroundColor;
  final FaIcon playIcon;
  final FaIcon notPlayIcon;

  @override
  ConsumerState<_CustomFeedButton> createState() => _CustomFeedButtonState();
}

class _CustomFeedButtonState extends ConsumerState<_CustomFeedButton> {
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
        ref.read(showAudioBarProvider.notifier).changeShowAudioBar();
      },
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            transitionBuilder: (child, ani) {
              return ScaleTransition(
                scale: ani,
                child: child,
              );
            },
            child: _isClicked ? widget.notPlayIcon : widget.playIcon,
          ),
        ),
      ),
    );
  }
}
