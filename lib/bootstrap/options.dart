import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fterm/model/tab_item.dart';

part 'options.freezed.dart';

const Freezed freezed = Freezed(
  toStringOverride: true,
  equal: true,
);

@freezed
class LaunchOptions with _$LaunchOptions {
  const factory LaunchOptions(
      {Locale? locale, TabItem? initTab, String? token}) = _LaunchOptions;
}
