import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:fterm/gen/native_serial_port.dart';

extension RandomX on Random {
  Uint8List nextBytes(int bytes) {
    var buffer = Uint8List(bytes);
    for (var i = 0; i < bytes; i++) {
      buffer[i] = nextInt(0xFF + 1);
    }
    return buffer;
  }
}

extension IntToString on int {
  String toHex() => '0x${toRadixString(16)}';

  String toPadded([int width = 3]) => toString().padLeft(width, '0');
}

extension SerialPortExt on SerialPort {
  SerialPortType get type {
    switch (transport) {
      case SerialPortTransport.usb:
        return SerialPortType.usbPort(UsbPortInfo(
            vid: vendorId ?? -1,
            pid: productId ?? -1,
            serialNumber: serialNumber,
            manufacturer: manufacturer,
            product: productName,
            interface: deviceNumber));
      case SerialPortTransport.bluetooth:
        return const SerialPortType.bluetoothPort();
      case SerialPortTransport.native:
        return const SerialPortType.pciPort();
      default:
        return const SerialPortType.unknown();
    }
  }
}
