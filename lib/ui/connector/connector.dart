import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'plugin.dart';

abstract class Connector {
  Stream<Uint8List> get output;

  StreamSink<Uint8List> get input;

  Future<int> get exitCode;

  void write(Uint8List data);

  Future<void> connect();

  void resize(width, height, pixelWidth, pixelHeight);

  bool get isRemote;

  String get title;

  Widget? get icon;

  Future<void> dispose();
  List<Plugin> get futures;
}
