import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

abstract class Connector {
  final Converter<String, List<int>> encoder;
  final Converter<List<int>, String> decoder;

  Connector(this.encoder, this.decoder);

  Stream<Uint8List> get output;

  //通常情况用直接调用write方法即可
  StreamSink<Uint8List> get input;

  Future<int> get exitCode;

  void write(Uint8List data);

  void writeString(String data);

  Future<void> connect();

  void resize(width, height, pixelWidth, pixelHeight);

  bool get isSupportZModel;

  String get title;

  Widget? get icon;

  Future<void> dispose();
}
