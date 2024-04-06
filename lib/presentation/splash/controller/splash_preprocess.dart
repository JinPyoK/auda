import 'package:auda/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushLoginScreen(BuildContext context) {
  Future.delayed(const Duration(seconds: 1), () {
    context.goNamed(CustomRouter.loginScreen);
  });
}
