import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class DragToMoveArea extends StatelessWidget {
  const DragToMoveArea({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) {
        appWindow.startDragging();
      },
      onDoubleTap: () async {
        appWindow.maximizeOrRestore();
      },
      child: child,
    );
  }
}
