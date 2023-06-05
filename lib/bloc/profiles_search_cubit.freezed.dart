// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfilesState {
  List<Item> get items => throw _privateConstructorUsedError;
  String get keyword => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Item> items, String keyword) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Item> items, String keyword)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Item> items, String keyword)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfilesStateCopyWith<ProfilesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilesStateCopyWith<$Res> {
  factory $ProfilesStateCopyWith(
          ProfilesState value, $Res Function(ProfilesState) then) =
      _$ProfilesStateCopyWithImpl<$Res, ProfilesState>;
  @useResult
  $Res call({List<Item> items, String keyword});
}

/// @nodoc
class _$ProfilesStateCopyWithImpl<$Res, $Val extends ProfilesState>
    implements $ProfilesStateCopyWith<$Res> {
  _$ProfilesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? keyword = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $ProfilesStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Item> items, String keyword});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProfilesStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? keyword = null,
  }) {
    return _then(_$_Initial(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(final List<Item> items, this.keyword) : _items = items;

  final List<Item> _items;
  @override
  List<Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String keyword;

  @override
  String toString() {
    return 'ProfilesState.initial(items: $items, keyword: $keyword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Item> items, String keyword) initial,
  }) {
    return initial(items, keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Item> items, String keyword)? initial,
  }) {
    return initial?.call(items, keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Item> items, String keyword)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(items, keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfilesState {
  const factory _Initial(final List<Item> items, final String keyword) =
      _$_Initial;

  @override
  List<Item> get items;
  @override
  String get keyword;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Item {
  String get header => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String header, bool isExpanded, List<SSHConfig> hosts)
        hosts,
    required TResult Function(
            String header, bool isExpanded, List<Shell> shells)
        shells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String header, bool isExpanded, List<SSHConfig> hosts)?
        hosts,
    TResult? Function(String header, bool isExpanded, List<Shell> shells)?
        shells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String header, bool isExpanded, List<SSHConfig> hosts)?
        hosts,
    TResult Function(String header, bool isExpanded, List<Shell> shells)?
        shells,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Hosts value) hosts,
    required TResult Function(_Shells value) shells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Hosts value)? hosts,
    TResult? Function(_Shells value)? shells,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Hosts value)? hosts,
    TResult Function(_Shells value)? shells,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call({String header, bool isExpanded});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HostsCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_HostsCopyWith(_$_Hosts value, $Res Function(_$_Hosts) then) =
      __$$_HostsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String header, bool isExpanded, List<SSHConfig> hosts});
}

/// @nodoc
class __$$_HostsCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Hosts>
    implements _$$_HostsCopyWith<$Res> {
  __$$_HostsCopyWithImpl(_$_Hosts _value, $Res Function(_$_Hosts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? isExpanded = null,
    Object? hosts = null,
  }) {
    return _then(_$_Hosts(
      null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      null == hosts
          ? _value._hosts
          : hosts // ignore: cast_nullable_to_non_nullable
              as List<SSHConfig>,
    ));
  }
}

/// @nodoc

class _$_Hosts implements _Hosts {
  const _$_Hosts(this.header, this.isExpanded, final List<SSHConfig> hosts)
      : _hosts = hosts;

  @override
  final String header;
  @override
  final bool isExpanded;
  final List<SSHConfig> _hosts;
  @override
  List<SSHConfig> get hosts {
    if (_hosts is EqualUnmodifiableListView) return _hosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hosts);
  }

  @override
  String toString() {
    return 'Item.hosts(header: $header, isExpanded: $isExpanded, hosts: $hosts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Hosts &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            const DeepCollectionEquality().equals(other._hosts, _hosts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, header, isExpanded,
      const DeepCollectionEquality().hash(_hosts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostsCopyWith<_$_Hosts> get copyWith =>
      __$$_HostsCopyWithImpl<_$_Hosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String header, bool isExpanded, List<SSHConfig> hosts)
        hosts,
    required TResult Function(
            String header, bool isExpanded, List<Shell> shells)
        shells,
  }) {
    return hosts(header, isExpanded, this.hosts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String header, bool isExpanded, List<SSHConfig> hosts)?
        hosts,
    TResult? Function(String header, bool isExpanded, List<Shell> shells)?
        shells,
  }) {
    return hosts?.call(header, isExpanded, this.hosts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String header, bool isExpanded, List<SSHConfig> hosts)?
        hosts,
    TResult Function(String header, bool isExpanded, List<Shell> shells)?
        shells,
    required TResult orElse(),
  }) {
    if (hosts != null) {
      return hosts(header, isExpanded, this.hosts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Hosts value) hosts,
    required TResult Function(_Shells value) shells,
  }) {
    return hosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Hosts value)? hosts,
    TResult? Function(_Shells value)? shells,
  }) {
    return hosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Hosts value)? hosts,
    TResult Function(_Shells value)? shells,
    required TResult orElse(),
  }) {
    if (hosts != null) {
      return hosts(this);
    }
    return orElse();
  }
}

abstract class _Hosts implements Item {
  const factory _Hosts(final String header, final bool isExpanded,
      final List<SSHConfig> hosts) = _$_Hosts;

  @override
  String get header;
  @override
  bool get isExpanded;
  List<SSHConfig> get hosts;
  @override
  @JsonKey(ignore: true)
  _$$_HostsCopyWith<_$_Hosts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ShellsCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ShellsCopyWith(_$_Shells value, $Res Function(_$_Shells) then) =
      __$$_ShellsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String header, bool isExpanded, List<Shell> shells});
}

/// @nodoc
class __$$_ShellsCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Shells>
    implements _$$_ShellsCopyWith<$Res> {
  __$$_ShellsCopyWithImpl(_$_Shells _value, $Res Function(_$_Shells) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? isExpanded = null,
    Object? shells = null,
  }) {
    return _then(_$_Shells(
      null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      null == shells
          ? _value._shells
          : shells // ignore: cast_nullable_to_non_nullable
              as List<Shell>,
    ));
  }
}

/// @nodoc

class _$_Shells implements _Shells {
  const _$_Shells(this.header, this.isExpanded, final List<Shell> shells)
      : _shells = shells;

  @override
  final String header;
  @override
  final bool isExpanded;
  final List<Shell> _shells;
  @override
  List<Shell> get shells {
    if (_shells is EqualUnmodifiableListView) return _shells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shells);
  }

  @override
  String toString() {
    return 'Item.shells(header: $header, isExpanded: $isExpanded, shells: $shells)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Shells &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            const DeepCollectionEquality().equals(other._shells, _shells));
  }

  @override
  int get hashCode => Object.hash(runtimeType, header, isExpanded,
      const DeepCollectionEquality().hash(_shells));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShellsCopyWith<_$_Shells> get copyWith =>
      __$$_ShellsCopyWithImpl<_$_Shells>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String header, bool isExpanded, List<SSHConfig> hosts)
        hosts,
    required TResult Function(
            String header, bool isExpanded, List<Shell> shells)
        shells,
  }) {
    return shells(header, isExpanded, this.shells);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String header, bool isExpanded, List<SSHConfig> hosts)?
        hosts,
    TResult? Function(String header, bool isExpanded, List<Shell> shells)?
        shells,
  }) {
    return shells?.call(header, isExpanded, this.shells);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String header, bool isExpanded, List<SSHConfig> hosts)?
        hosts,
    TResult Function(String header, bool isExpanded, List<Shell> shells)?
        shells,
    required TResult orElse(),
  }) {
    if (shells != null) {
      return shells(header, isExpanded, this.shells);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Hosts value) hosts,
    required TResult Function(_Shells value) shells,
  }) {
    return shells(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Hosts value)? hosts,
    TResult? Function(_Shells value)? shells,
  }) {
    return shells?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Hosts value)? hosts,
    TResult Function(_Shells value)? shells,
    required TResult orElse(),
  }) {
    if (shells != null) {
      return shells(this);
    }
    return orElse();
  }
}

abstract class _Shells implements Item {
  const factory _Shells(final String header, final bool isExpanded,
      final List<Shell> shells) = _$_Shells;

  @override
  String get header;
  @override
  bool get isExpanded;
  List<Shell> get shells;
  @override
  @JsonKey(ignore: true)
  _$$_ShellsCopyWith<_$_Shells> get copyWith =>
      throw _privateConstructorUsedError;
}
