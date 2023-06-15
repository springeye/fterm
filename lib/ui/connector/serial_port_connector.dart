import 'dart:async';
import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:fterm/ui/connector/connector.dart';

import '../../gen/native_serial_port.dart';

class SerialPortConnector extends Connector {
  final SerialPortInfo port;

  SerialPortConnector(this.port)
      : _port = SerialPort(port.portName),
        super(utf8.encoder, utf8.decoder);
  final SerialPort _port;
  final _outputController = StreamController<Uint8List>();

  @override
  Future<void> connect() {
    _outputController.add(Uint8List.fromList(encoder.convert("正在打开串口...")));
    return Future(() {
      if (!_port.openReadWrite()) {
        throw SerialPort.lastError ?? Exception("open port faild");
      }
      _outputController.addStream(SerialPortReader(_port).stream);
      _stdinController.stream.listen(_port.write);
    });
  }

  @override
  Future<void> dispose() async {
    _stdinController.close();
    _exitController.close();
    _port.close();
  }

  final _exitController = StreamController<int>();

  @override
  Future<int> get exitCode => _exitController.stream.first;
  final _stdinController = StreamController<Uint8List>();

  @override
  Widget? get icon => null;

  @override
  StreamSink<Uint8List> get input => _stdinController.sink;

  @override
  bool get isSupportZModel => false;

  @override
  Stream<Uint8List> get output => _outputController.stream;

  @override
  void resize(width, height, pixelWidth, pixelHeight) {}

  @override
  String get title => port.portName;

  @override
  void write(Uint8List data) {
    _port.write(data);
  }

  @override
  void writeString(String data) {
    write(Uint8List.fromList(encoder.convert(data)));
  }
}
