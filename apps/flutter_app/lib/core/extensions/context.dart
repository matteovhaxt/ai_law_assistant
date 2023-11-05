import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/features/auth/auth.dart';
import 'package:flutter_app/core/core.dart';

extension UIContext on BuildContext {
  // constants
  UIPadding get padding => const UIPadding();
  UIAnimation get animation => const UIAnimation();

  // inherited
  ThemeData get theme => Theme.of(this);
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // state
  User? get user => read<AuthCubit>().currentUser;

  // debug
  Logger get logger => Logger();

  // ui
  bool get isMobile => mediaQuery.size.width < 600;
  bool get isTablet =>
      mediaQuery.size.width >= 600 && mediaQuery.size.width < 900;
  bool get isDesktop => mediaQuery.size.width > 900;
  int get centerWidgetFlex => isMobile
      ? 8
      : isTablet
          ? 4
          : isDesktop
              ? 2
              : 1;
  int get wideCenterWidgetFlex => isMobile
      ? 16
      : isTablet
          ? 8
          : isDesktop
              ? 4
              : 2;
}
