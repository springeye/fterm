
import 'package:flutter/material.dart';

import 'drag_to_move_area.dart';

class DraggebleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Brightness brightness;

  const DraggebleAppBar({
    super.key,
    required this.brightness,
  });

  @override
  Widget build(BuildContext context) {
    //0xff1C1C1C
    return  DragToMoveArea(
      child: Container(
        height: kToolbarHeight / 1.4,
/*        child: Platform.isWindows?WindowCaption(
          brightness: brightness,
        ):null,*/
      ),
    );

  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
