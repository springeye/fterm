import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:fterm/ui/windows/window_caption_button.dart';



import 'drag_to_move_area.dart';

const double kWindowCaptionHeight = 32;

/// A widget to simulate the title bar of windows 11.
///
/// {@tool snippet}
///
/// ```dart
/// Scaffold(
///   appBar: PreferredSize(
///     child: WindowCaption(
///       brightness: Theme.of(context).brightness,
///       title: Text('window_manager_example'),
///     ),
///     preferredSize: const Size.fromHeight(kWindowCaptionHeight),
///   ),
/// )
/// ```
/// {@end-tool}
class WindowCaption extends StatefulWidget {
  const WindowCaption({
    Key? key,
    this.title,
    this.backgroundColor,
    this.brightness,
  }) : super(key: key);

  final Widget? title;
  final Color? backgroundColor;
  final Brightness? brightness;

  @override
  State<WindowCaption> createState() => _WindowCaptionState();
}

class _WindowCaptionState extends State<WindowCaption>  {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ??
            (widget.brightness == Brightness.dark
                ? const Color(0xff1C1C1C)
                : Colors.transparent),
      ),
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: SizedBox(
                height: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: widget.brightness == Brightness.light
                              ? Colors.black.withOpacity(0.8956)
                              : Colors.white,
                          fontSize: 14,
                        ),
                        child: widget.title ?? Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          WindowCaptionButton.minimize(
            brightness: widget.brightness,
            onPressed: () async {
              bool isMinimized =  !appWindow.isVisible;
              if (isMinimized) {
                appWindow.restore();
              } else {
                appWindow.minimize();
              }
            },
          ),
          appWindow.isMaximized?WindowCaptionButton.unmaximize(
            brightness: widget.brightness,
            onPressed: () {
              setState(() {
                appWindow.restore();
              });
            },
          ):WindowCaptionButton.maximize(
            brightness: widget.brightness,
            onPressed: () {
              setState(() {
                appWindow.maximize();
              });
            },
          ),
          WindowCaptionButton.close(
            brightness: widget.brightness,
            onPressed: () {
              appWindow.close();
            },
          ),
        ],
      ),
    );
  }

  @override
  void onWindowMaximize() {
    setState(() {});
  }

  @override
  void onWindowUnmaximize() {
    setState(() {});
  }
}
