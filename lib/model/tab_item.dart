import 'package:flutter/material.dart';

abstract class TabItem {
  final title = ValueNotifier<Widget?>(null);
  final content = ValueNotifier<Widget?>(null);
  final icon = ValueNotifier<Widget?>(null);
}
