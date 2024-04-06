import 'package:auda/core/constant/assets_file_path.dart';
import 'package:auda/presentation/auth/widget/auth_button.dart';
import 'package:auda/presentation/common/widget/custom_text_field.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 7,
            ),
            Hero(
              tag: "login",
              child: Image.asset(
                AssetPath.appBarLogo,
                width: 180.w,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            CustomTextField(
              hintText: "ID",
              validator: (val) => val,
              helperText: "이메일 형식으로 입력해주세요",
            ),
            const Spacer(
              flex: 1,
            ),
            CustomTextField(
              hintText: "PW",
              validator: (val) => val,
              helperText: "영문, 숫자, 특수문자 포함 8자 이상",
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AuthButton(onPressed: () {}, text: "비밀번호 찾기"),
                AuthButton(onPressed: () {}, text: "회원가입"),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: GoogleAuthButton(
                    text: "구글 아이디로 로그인",
                    style: AuthButtonStyle(
                      separator: 15.w,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: FacebookAuthButton(
                    text: "페이스북 아이디로 로그인",
                    style: AuthButtonStyle(
                      separator: 15.w,
                      buttonType: AuthButtonType.secondary,
                      // iconType: AuthIconType.secondary,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: AppleAuthButton(
                    text: "애플 아이디로 로그인",
                    style: AuthButtonStyle(
                      separator: 15.w,
                      buttonType: AuthButtonType.secondary,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 15,
            ),
          ],
        ),
      ),
    );
  }
}
