

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fterm/bloc/app_config_cubit.dart';
import 'package:fterm/ui/desktop_home.dart';

import 'windows/draggeble_bar.dart';


class DesktopWindow extends StatefulWidget {
  const DesktopWindow({Key? key}) : super(key: key);

  @override
  State<DesktopWindow> createState() => _DesktopWindowState();
}

class _DesktopWindowState extends State<DesktopWindow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
      return BlocBuilder<AppConfigCubit, AppConfigState>(
        builder: (context, state) {

            return const Stack(
              children: [
                DesktopHome(),
                  DraggebleAppBar(
                      brightness: Brightness.dark),
              ],
            );
        },
      );
  }
}
