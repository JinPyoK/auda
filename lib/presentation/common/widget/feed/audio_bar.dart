import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomAudioBar extends StatelessWidget {
  const BottomAudioBar({super.key});

  static String title = 'Title';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xdd0096ff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 80.h,
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: BottomAudioBar.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15.h,
                    child: _SpeechOption(
                      optionName: '속도',
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    child: _SpeechOption(
                      optionName: '볼륨',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const _PlayButton(),
        ],
      ),
    );
  }
}

class _PlayButton extends StatefulWidget {
  const _PlayButton({super.key});

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton> {
  bool _isPlay = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50.w,
      onPressed: () {
        setState(() {
          _isPlay = !_isPlay;
        });
      },
      icon: FaIcon(
        _isPlay ? FontAwesomeIcons.circlePause : FontAwesomeIcons.circlePlay,
        color: Colors.white,
      ),
    );
  }
}

class _SpeechOption extends StatefulWidget {
  const _SpeechOption({
    required this.optionName,
  });

  final String optionName;

  @override
  State<_SpeechOption> createState() => _SpeechOptionState();
}

class _SpeechOptionState extends State<_SpeechOption> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.optionName,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Slider(
          value: _value,
          divisions: 10,
          max: 10,
          label: ' ${_value.toInt()} ',
          onChanged: (val) {
            setState(() {
              _value = val;
            });
          },
          inactiveColor: Colors.white,
        ),
      ],
    );
  }
}
