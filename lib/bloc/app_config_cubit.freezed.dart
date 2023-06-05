// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppConfigState {
  Locale? get locale => throw _privateConstructorUsedError;
  Map<String, TerminalTheme> get colorSchemes =>
      throw _privateConstructorUsedError;
  TerminalTheme get currentColor => throw _privateConstructorUsedError;
  String get currentColorName => throw _privateConstructorUsedError;
  bool get showFPS => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppConfigStateCopyWith<AppConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigStateCopyWith<$Res> {
  factory $AppConfigStateCopyWith(
          AppConfigState value, $Res Function(AppConfigState) then) =
      _$AppConfigStateCopyWithImpl<$Res, AppConfigState>;
  @useResult
  $Res call(
      {Locale? locale,
      Map<String, TerminalTheme> colorSchemes,
      TerminalTheme currentColor,
      String currentColorName,
      bool showFPS});
}

/// @nodoc
class _$AppConfigStateCopyWithImpl<$Res, $Val extends AppConfigState>
    implements $AppConfigStateCopyWith<$Res> {
  _$AppConfigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? colorSchemes = null,
    Object? currentColor = null,
    Object? currentColorName = null,
    Object? showFPS = null,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      colorSchemes: null == colorSchemes
          ? _value.colorSchemes
          : colorSchemes // ignore: cast_nullable_to_non_nullable
              as Map<String, TerminalTheme>,
      currentColor: null == currentColor
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as TerminalTheme,
      currentColorName: null == currentColorName
          ? _value.currentColorName
          : currentColorName // ignore: cast_nullable_to_non_nullable
              as String,
      showFPS: null == showFPS
          ? _value.showFPS
          : showFPS // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppConfigStateCopyWith<$Res>
    implements $AppConfigStateCopyWith<$Res> {
  factory _$$_AppConfigStateCopyWith(
          _$_AppConfigState value, $Res Function(_$_AppConfigState) then) =
      __$$_AppConfigStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Locale? locale,
      Map<String, TerminalTheme> colorSchemes,
      TerminalTheme currentColor,
      String currentColorName,
      bool showFPS});
}

/// @nodoc
class __$$_AppConfigStateCopyWithImpl<$Res>
    extends _$AppConfigStateCopyWithImpl<$Res, _$_AppConfigState>
    implements _$$_AppConfigStateCopyWith<$Res> {
  __$$_AppConfigStateCopyWithImpl(
      _$_AppConfigState _value, $Res Function(_$_AppConfigState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? colorSchemes = null,
    Object? currentColor = null,
    Object? currentColorName = null,
    Object? showFPS = null,
  }) {
    return _then(_$_AppConfigState(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      colorSchemes: null == colorSchemes
          ? _value._colorSchemes
          : colorSchemes // ignore: cast_nullable_to_non_nullable
              as Map<String, TerminalTheme>,
      currentColor: null == currentColor
          ? _value.currentColor
          : currentColor // ignore: cast_nullable_to_non_nullable
              as TerminalTheme,
      currentColorName: null == currentColorName
          ? _value.currentColorName
          : currentColorName // ignore: cast_nullable_to_non_nullable
              as String,
      showFPS: null == showFPS
          ? _value.showFPS
          : showFPS // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppConfigState implements _AppConfigState {
  const _$_AppConfigState(
      {this.locale,
      final Map<String, TerminalTheme> colorSchemes = const {},
      this.currentColor = TerminalThemes.defaultTheme,
      this.currentColorName = "default",
      this.showFPS = false})
      : _colorSchemes = colorSchemes;

  @override
  final Locale? locale;
  final Map<String, TerminalTheme> _colorSchemes;
  @override
  @JsonKey()
  Map<String, TerminalTheme> get colorSchemes {
    if (_colorSchemes is EqualUnmodifiableMapView) return _colorSchemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_colorSchemes);
  }

  @override
  @JsonKey()
  final TerminalTheme currentColor;
  @override
  @JsonKey()
  final String currentColorName;
  @override
  @JsonKey()
  final bool showFPS;

  @override
  String toString() {
    return 'AppConfigState(locale: $locale, colorSchemes: $colorSchemes, currentColor: $currentColor, currentColorName: $currentColorName, showFPS: $showFPS)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppConfigState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            const DeepCollectionEquality()
                .equals(other._colorSchemes, _colorSchemes) &&
            (identical(other.currentColor, currentColor) ||
                other.currentColor == currentColor) &&
            (identical(other.currentColorName, currentColorName) ||
                other.currentColorName == currentColorName) &&
            (identical(other.showFPS, showFPS) || other.showFPS == showFPS));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      locale,
      const DeepCollectionEquality().hash(_colorSchemes),
      currentColor,
      currentColorName,
      showFPS);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppConfigStateCopyWith<_$_AppConfigState> get copyWith =>
      __$$_AppConfigStateCopyWithImpl<_$_AppConfigState>(this, _$identity);
}

abstract class _AppConfigState implements AppConfigState {
  const factory _AppConfigState(
      {final Locale? locale,
      final Map<String, TerminalTheme> colorSchemes,
      final TerminalTheme currentColor,
      final String currentColorName,
      final bool showFPS}) = _$_AppConfigState;

  @override
  Locale? get locale;
  @override
  Map<String, TerminalTheme> get colorSchemes;
  @override
  TerminalTheme get currentColor;
  @override
  String get currentColorName;
  @override
  bool get showFPS;
  @override
  @JsonKey(ignore: true)
  _$$_AppConfigStateCopyWith<_$_AppConfigState> get copyWith =>
      throw _privateConstructorUsedError;
}
