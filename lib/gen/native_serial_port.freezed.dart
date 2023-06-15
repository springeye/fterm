// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'native_serial_port.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SerialPortType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UsbPortInfo field0) usbPort,
    required TResult Function() pciPort,
    required TResult Function() bluetoothPort,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UsbPortInfo field0)? usbPort,
    TResult? Function()? pciPort,
    TResult? Function()? bluetoothPort,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UsbPortInfo field0)? usbPort,
    TResult Function()? pciPort,
    TResult Function()? bluetoothPort,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerialPortType_UsbPort value) usbPort,
    required TResult Function(SerialPortType_PciPort value) pciPort,
    required TResult Function(SerialPortType_BluetoothPort value) bluetoothPort,
    required TResult Function(SerialPortType_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerialPortType_UsbPort value)? usbPort,
    TResult? Function(SerialPortType_PciPort value)? pciPort,
    TResult? Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult? Function(SerialPortType_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerialPortType_UsbPort value)? usbPort,
    TResult Function(SerialPortType_PciPort value)? pciPort,
    TResult Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult Function(SerialPortType_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SerialPortTypeCopyWith<$Res> {
  factory $SerialPortTypeCopyWith(
          SerialPortType value, $Res Function(SerialPortType) then) =
      _$SerialPortTypeCopyWithImpl<$Res, SerialPortType>;
}

/// @nodoc
class _$SerialPortTypeCopyWithImpl<$Res, $Val extends SerialPortType>
    implements $SerialPortTypeCopyWith<$Res> {
  _$SerialPortTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SerialPortType_UsbPortCopyWith<$Res> {
  factory _$$SerialPortType_UsbPortCopyWith(_$SerialPortType_UsbPort value,
          $Res Function(_$SerialPortType_UsbPort) then) =
      __$$SerialPortType_UsbPortCopyWithImpl<$Res>;
  @useResult
  $Res call({UsbPortInfo field0});
}

/// @nodoc
class __$$SerialPortType_UsbPortCopyWithImpl<$Res>
    extends _$SerialPortTypeCopyWithImpl<$Res, _$SerialPortType_UsbPort>
    implements _$$SerialPortType_UsbPortCopyWith<$Res> {
  __$$SerialPortType_UsbPortCopyWithImpl(_$SerialPortType_UsbPort _value,
      $Res Function(_$SerialPortType_UsbPort) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field0 = null,
  }) {
    return _then(_$SerialPortType_UsbPort(
      null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as UsbPortInfo,
    ));
  }
}

/// @nodoc

class _$SerialPortType_UsbPort implements SerialPortType_UsbPort {
  const _$SerialPortType_UsbPort(this.field0);

  @override
  final UsbPortInfo field0;

  @override
  String toString() {
    return 'SerialPortType.usbPort(field0: $field0)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerialPortType_UsbPort &&
            (identical(other.field0, field0) || other.field0 == field0));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field0);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SerialPortType_UsbPortCopyWith<_$SerialPortType_UsbPort> get copyWith =>
      __$$SerialPortType_UsbPortCopyWithImpl<_$SerialPortType_UsbPort>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UsbPortInfo field0) usbPort,
    required TResult Function() pciPort,
    required TResult Function() bluetoothPort,
    required TResult Function() unknown,
  }) {
    return usbPort(field0);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UsbPortInfo field0)? usbPort,
    TResult? Function()? pciPort,
    TResult? Function()? bluetoothPort,
    TResult? Function()? unknown,
  }) {
    return usbPort?.call(field0);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UsbPortInfo field0)? usbPort,
    TResult Function()? pciPort,
    TResult Function()? bluetoothPort,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (usbPort != null) {
      return usbPort(field0);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerialPortType_UsbPort value) usbPort,
    required TResult Function(SerialPortType_PciPort value) pciPort,
    required TResult Function(SerialPortType_BluetoothPort value) bluetoothPort,
    required TResult Function(SerialPortType_Unknown value) unknown,
  }) {
    return usbPort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerialPortType_UsbPort value)? usbPort,
    TResult? Function(SerialPortType_PciPort value)? pciPort,
    TResult? Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult? Function(SerialPortType_Unknown value)? unknown,
  }) {
    return usbPort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerialPortType_UsbPort value)? usbPort,
    TResult Function(SerialPortType_PciPort value)? pciPort,
    TResult Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult Function(SerialPortType_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (usbPort != null) {
      return usbPort(this);
    }
    return orElse();
  }
}

abstract class SerialPortType_UsbPort implements SerialPortType {
  const factory SerialPortType_UsbPort(final UsbPortInfo field0) =
      _$SerialPortType_UsbPort;

  UsbPortInfo get field0;
  @JsonKey(ignore: true)
  _$$SerialPortType_UsbPortCopyWith<_$SerialPortType_UsbPort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SerialPortType_PciPortCopyWith<$Res> {
  factory _$$SerialPortType_PciPortCopyWith(_$SerialPortType_PciPort value,
          $Res Function(_$SerialPortType_PciPort) then) =
      __$$SerialPortType_PciPortCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SerialPortType_PciPortCopyWithImpl<$Res>
    extends _$SerialPortTypeCopyWithImpl<$Res, _$SerialPortType_PciPort>
    implements _$$SerialPortType_PciPortCopyWith<$Res> {
  __$$SerialPortType_PciPortCopyWithImpl(_$SerialPortType_PciPort _value,
      $Res Function(_$SerialPortType_PciPort) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SerialPortType_PciPort implements SerialPortType_PciPort {
  const _$SerialPortType_PciPort();

  @override
  String toString() {
    return 'SerialPortType.pciPort()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SerialPortType_PciPort);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UsbPortInfo field0) usbPort,
    required TResult Function() pciPort,
    required TResult Function() bluetoothPort,
    required TResult Function() unknown,
  }) {
    return pciPort();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UsbPortInfo field0)? usbPort,
    TResult? Function()? pciPort,
    TResult? Function()? bluetoothPort,
    TResult? Function()? unknown,
  }) {
    return pciPort?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UsbPortInfo field0)? usbPort,
    TResult Function()? pciPort,
    TResult Function()? bluetoothPort,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (pciPort != null) {
      return pciPort();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerialPortType_UsbPort value) usbPort,
    required TResult Function(SerialPortType_PciPort value) pciPort,
    required TResult Function(SerialPortType_BluetoothPort value) bluetoothPort,
    required TResult Function(SerialPortType_Unknown value) unknown,
  }) {
    return pciPort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerialPortType_UsbPort value)? usbPort,
    TResult? Function(SerialPortType_PciPort value)? pciPort,
    TResult? Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult? Function(SerialPortType_Unknown value)? unknown,
  }) {
    return pciPort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerialPortType_UsbPort value)? usbPort,
    TResult Function(SerialPortType_PciPort value)? pciPort,
    TResult Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult Function(SerialPortType_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (pciPort != null) {
      return pciPort(this);
    }
    return orElse();
  }
}

abstract class SerialPortType_PciPort implements SerialPortType {
  const factory SerialPortType_PciPort() = _$SerialPortType_PciPort;
}

/// @nodoc
abstract class _$$SerialPortType_BluetoothPortCopyWith<$Res> {
  factory _$$SerialPortType_BluetoothPortCopyWith(
          _$SerialPortType_BluetoothPort value,
          $Res Function(_$SerialPortType_BluetoothPort) then) =
      __$$SerialPortType_BluetoothPortCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SerialPortType_BluetoothPortCopyWithImpl<$Res>
    extends _$SerialPortTypeCopyWithImpl<$Res, _$SerialPortType_BluetoothPort>
    implements _$$SerialPortType_BluetoothPortCopyWith<$Res> {
  __$$SerialPortType_BluetoothPortCopyWithImpl(
      _$SerialPortType_BluetoothPort _value,
      $Res Function(_$SerialPortType_BluetoothPort) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SerialPortType_BluetoothPort implements SerialPortType_BluetoothPort {
  const _$SerialPortType_BluetoothPort();

  @override
  String toString() {
    return 'SerialPortType.bluetoothPort()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerialPortType_BluetoothPort);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UsbPortInfo field0) usbPort,
    required TResult Function() pciPort,
    required TResult Function() bluetoothPort,
    required TResult Function() unknown,
  }) {
    return bluetoothPort();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UsbPortInfo field0)? usbPort,
    TResult? Function()? pciPort,
    TResult? Function()? bluetoothPort,
    TResult? Function()? unknown,
  }) {
    return bluetoothPort?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UsbPortInfo field0)? usbPort,
    TResult Function()? pciPort,
    TResult Function()? bluetoothPort,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (bluetoothPort != null) {
      return bluetoothPort();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerialPortType_UsbPort value) usbPort,
    required TResult Function(SerialPortType_PciPort value) pciPort,
    required TResult Function(SerialPortType_BluetoothPort value) bluetoothPort,
    required TResult Function(SerialPortType_Unknown value) unknown,
  }) {
    return bluetoothPort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerialPortType_UsbPort value)? usbPort,
    TResult? Function(SerialPortType_PciPort value)? pciPort,
    TResult? Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult? Function(SerialPortType_Unknown value)? unknown,
  }) {
    return bluetoothPort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerialPortType_UsbPort value)? usbPort,
    TResult Function(SerialPortType_PciPort value)? pciPort,
    TResult Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult Function(SerialPortType_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (bluetoothPort != null) {
      return bluetoothPort(this);
    }
    return orElse();
  }
}

abstract class SerialPortType_BluetoothPort implements SerialPortType {
  const factory SerialPortType_BluetoothPort() = _$SerialPortType_BluetoothPort;
}

/// @nodoc
abstract class _$$SerialPortType_UnknownCopyWith<$Res> {
  factory _$$SerialPortType_UnknownCopyWith(_$SerialPortType_Unknown value,
          $Res Function(_$SerialPortType_Unknown) then) =
      __$$SerialPortType_UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SerialPortType_UnknownCopyWithImpl<$Res>
    extends _$SerialPortTypeCopyWithImpl<$Res, _$SerialPortType_Unknown>
    implements _$$SerialPortType_UnknownCopyWith<$Res> {
  __$$SerialPortType_UnknownCopyWithImpl(_$SerialPortType_Unknown _value,
      $Res Function(_$SerialPortType_Unknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SerialPortType_Unknown implements SerialPortType_Unknown {
  const _$SerialPortType_Unknown();

  @override
  String toString() {
    return 'SerialPortType.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SerialPortType_Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UsbPortInfo field0) usbPort,
    required TResult Function() pciPort,
    required TResult Function() bluetoothPort,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UsbPortInfo field0)? usbPort,
    TResult? Function()? pciPort,
    TResult? Function()? bluetoothPort,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UsbPortInfo field0)? usbPort,
    TResult Function()? pciPort,
    TResult Function()? bluetoothPort,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SerialPortType_UsbPort value) usbPort,
    required TResult Function(SerialPortType_PciPort value) pciPort,
    required TResult Function(SerialPortType_BluetoothPort value) bluetoothPort,
    required TResult Function(SerialPortType_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SerialPortType_UsbPort value)? usbPort,
    TResult? Function(SerialPortType_PciPort value)? pciPort,
    TResult? Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult? Function(SerialPortType_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SerialPortType_UsbPort value)? usbPort,
    TResult Function(SerialPortType_PciPort value)? pciPort,
    TResult Function(SerialPortType_BluetoothPort value)? bluetoothPort,
    TResult Function(SerialPortType_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class SerialPortType_Unknown implements SerialPortType {
  const factory SerialPortType_Unknown() = _$SerialPortType_Unknown;
}
