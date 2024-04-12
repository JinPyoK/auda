import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_audio_bar.g.dart';

@Riverpod(keepAlive: true)
class ShowAudioBar extends _$ShowAudioBar {
  @override
  bool build() {
    return false;
  }

  void changeShowAudioBar() {
    state = !state;
  }
}
