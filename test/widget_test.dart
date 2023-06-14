// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fterm/di/di.dart';

import 'package:win32_registry/win32_registry.dart';
import 'package:path/path.dart' as path;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {});

  setUp(() {});

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    _getWsl();
  });
}

void _getWsl() {
  const lxssPath = r'Software\\Microsoft\\Windows\\CurrentVersion\\Lxss';

  final key = Registry.openPath(RegistryHive.currentUser, path: lxssPath);
  print('Values:\n');
  for (final value in key.values) {
    print(' - ${value.name}==>${value.data}');
  }
  print(key.getValueAsString("DefaultDistribution"));
  print('\n----------------------------------------'
      '----------------------------------------\n');

  print('Subkeys:\n');
  for (final subkey in key.subkeyNames) {
    print(' - $subkey');
  }
  key.close();
}
