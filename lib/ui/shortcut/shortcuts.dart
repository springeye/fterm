import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fterm/utils/target_platform.dart';

SingleActivator get openSettings {
  return defaultTargetPlatform.isApple
      ? const SingleActivator(
          LogicalKeyboardKey.comma,
          meta: true,
        )
      : const SingleActivator(
          LogicalKeyboardKey.comma,
          control: true,
        );
}

SingleActivator get tabOpen {
  return defaultTargetPlatform.isApple
      ? const SingleActivator(
          LogicalKeyboardKey.keyT,
          meta: true,
        )
      : const SingleActivator(
          LogicalKeyboardKey.keyT,
          alt: true,
          shift: true,
        );
}

SingleActivator get tabClose {
  return defaultTargetPlatform.isApple
      ? const SingleActivator(
          LogicalKeyboardKey.keyW,
          meta: true,
        )
      : const SingleActivator(LogicalKeyboardKey.keyW, shift: true, alt: true);
}
