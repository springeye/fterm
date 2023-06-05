// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LaunchOptions {
  Locale? get locale => throw _privateConstructorUsedError;
  TabItem? get initTab => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LaunchOptionsCopyWith<LaunchOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchOptionsCopyWith<$Res> {
  factory $LaunchOptionsCopyWith(
          LaunchOptions value, $Res Function(LaunchOptions) then) =
      _$LaunchOptionsCopyWithImpl<$Res, LaunchOptions>;
  @useResult
  $Res call({Locale? locale, TabItem? initTab, String? token});
}

/// @nodoc
class _$LaunchOptionsCopyWithImpl<$Res, $Val extends LaunchOptions>
    implements $LaunchOptionsCopyWith<$Res> {
  _$LaunchOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? initTab = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      initTab: freezed == initTab
          ? _value.initTab
          : initTab // ignore: cast_nullable_to_non_nullable
              as TabItem?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LaunchOptionsCopyWith<$Res>
    implements $LaunchOptionsCopyWith<$Res> {
  factory _$$_LaunchOptionsCopyWith(
          _$_LaunchOptions value, $Res Function(_$_LaunchOptions) then) =
      __$$_LaunchOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale? locale, TabItem? initTab, String? token});
}

/// @nodoc
class __$$_LaunchOptionsCopyWithImpl<$Res>
    extends _$LaunchOptionsCopyWithImpl<$Res, _$_LaunchOptions>
    implements _$$_LaunchOptionsCopyWith<$Res> {
  __$$_LaunchOptionsCopyWithImpl(
      _$_LaunchOptions _value, $Res Function(_$_LaunchOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? initTab = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_LaunchOptions(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      initTab: freezed == initTab
          ? _value.initTab
          : initTab // ignore: cast_nullable_to_non_nullable
              as TabItem?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LaunchOptions implements _LaunchOptions {
  const _$_LaunchOptions({this.locale, this.initTab, this.token});

  @override
  final Locale? locale;
  @override
  final TabItem? initTab;
  @override
  final String? token;

  @override
  String toString() {
    return 'LaunchOptions(locale: $locale, initTab: $initTab, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LaunchOptions &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.initTab, initTab) || other.initTab == initTab) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, initTab, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LaunchOptionsCopyWith<_$_LaunchOptions> get copyWith =>
      __$$_LaunchOptionsCopyWithImpl<_$_LaunchOptions>(this, _$identity);
}

abstract class _LaunchOptions implements LaunchOptions {
  const factory _LaunchOptions(
      {final Locale? locale,
      final TabItem? initTab,
      final String? token}) = _$_LaunchOptions;

  @override
  Locale? get locale;
  @override
  TabItem? get initTab;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$_LaunchOptionsCopyWith<_$_LaunchOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
