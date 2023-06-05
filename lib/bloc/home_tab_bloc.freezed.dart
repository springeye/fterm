// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_tab_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeTabEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TabItem tab) add,
    required TResult Function(TabItem tab) remove,
    required TResult Function(int index) change,
    required TResult Function(int oldIndex, int newIndex) reorder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TabItem tab)? add,
    TResult? Function(TabItem tab)? remove,
    TResult? Function(int index)? change,
    TResult? Function(int oldIndex, int newIndex)? reorder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TabItem tab)? add,
    TResult Function(TabItem tab)? remove,
    TResult Function(int index)? change,
    TResult Function(int oldIndex, int newIndex)? reorder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Change value) change,
    required TResult Function(_Reorder value) reorder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Change value)? change,
    TResult? Function(_Reorder value)? reorder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Change value)? change,
    TResult Function(_Reorder value)? reorder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeTabEventCopyWith<$Res> {
  factory $HomeTabEventCopyWith(
          HomeTabEvent value, $Res Function(HomeTabEvent) then) =
      _$HomeTabEventCopyWithImpl<$Res, HomeTabEvent>;
}

/// @nodoc
class _$HomeTabEventCopyWithImpl<$Res, $Val extends HomeTabEvent>
    implements $HomeTabEventCopyWith<$Res> {
  _$HomeTabEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AddCopyWith<$Res> {
  factory _$$_AddCopyWith(_$_Add value, $Res Function(_$_Add) then) =
      __$$_AddCopyWithImpl<$Res>;
  @useResult
  $Res call({TabItem tab});
}

/// @nodoc
class __$$_AddCopyWithImpl<$Res>
    extends _$HomeTabEventCopyWithImpl<$Res, _$_Add>
    implements _$$_AddCopyWith<$Res> {
  __$$_AddCopyWithImpl(_$_Add _value, $Res Function(_$_Add) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_$_Add(
      null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as TabItem,
    ));
  }
}

/// @nodoc

class _$_Add implements _Add {
  const _$_Add(this.tab);

  @override
  final TabItem tab;

  @override
  String toString() {
    return 'HomeTabEvent.add(tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Add &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCopyWith<_$_Add> get copyWith =>
      __$$_AddCopyWithImpl<_$_Add>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TabItem tab) add,
    required TResult Function(TabItem tab) remove,
    required TResult Function(int index) change,
    required TResult Function(int oldIndex, int newIndex) reorder,
  }) {
    return add(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TabItem tab)? add,
    TResult? Function(TabItem tab)? remove,
    TResult? Function(int index)? change,
    TResult? Function(int oldIndex, int newIndex)? reorder,
  }) {
    return add?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TabItem tab)? add,
    TResult Function(TabItem tab)? remove,
    TResult Function(int index)? change,
    TResult Function(int oldIndex, int newIndex)? reorder,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Change value) change,
    required TResult Function(_Reorder value) reorder,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Change value)? change,
    TResult? Function(_Reorder value)? reorder,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Change value)? change,
    TResult Function(_Reorder value)? reorder,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements HomeTabEvent {
  const factory _Add(final TabItem tab) = _$_Add;

  TabItem get tab;
  @JsonKey(ignore: true)
  _$$_AddCopyWith<_$_Add> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveCopyWith<$Res> {
  factory _$$_RemoveCopyWith(_$_Remove value, $Res Function(_$_Remove) then) =
      __$$_RemoveCopyWithImpl<$Res>;
  @useResult
  $Res call({TabItem tab});
}

/// @nodoc
class __$$_RemoveCopyWithImpl<$Res>
    extends _$HomeTabEventCopyWithImpl<$Res, _$_Remove>
    implements _$$_RemoveCopyWith<$Res> {
  __$$_RemoveCopyWithImpl(_$_Remove _value, $Res Function(_$_Remove) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
  }) {
    return _then(_$_Remove(
      null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as TabItem,
    ));
  }
}

/// @nodoc

class _$_Remove implements _Remove {
  const _$_Remove(this.tab);

  @override
  final TabItem tab;

  @override
  String toString() {
    return 'HomeTabEvent.remove(tab: $tab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Remove &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveCopyWith<_$_Remove> get copyWith =>
      __$$_RemoveCopyWithImpl<_$_Remove>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TabItem tab) add,
    required TResult Function(TabItem tab) remove,
    required TResult Function(int index) change,
    required TResult Function(int oldIndex, int newIndex) reorder,
  }) {
    return remove(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TabItem tab)? add,
    TResult? Function(TabItem tab)? remove,
    TResult? Function(int index)? change,
    TResult? Function(int oldIndex, int newIndex)? reorder,
  }) {
    return remove?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TabItem tab)? add,
    TResult Function(TabItem tab)? remove,
    TResult Function(int index)? change,
    TResult Function(int oldIndex, int newIndex)? reorder,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Change value) change,
    required TResult Function(_Reorder value) reorder,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Change value)? change,
    TResult? Function(_Reorder value)? reorder,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Change value)? change,
    TResult Function(_Reorder value)? reorder,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements HomeTabEvent {
  const factory _Remove(final TabItem tab) = _$_Remove;

  TabItem get tab;
  @JsonKey(ignore: true)
  _$$_RemoveCopyWith<_$_Remove> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeCopyWith<$Res> {
  factory _$$_ChangeCopyWith(_$_Change value, $Res Function(_$_Change) then) =
      __$$_ChangeCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ChangeCopyWithImpl<$Res>
    extends _$HomeTabEventCopyWithImpl<$Res, _$_Change>
    implements _$$_ChangeCopyWith<$Res> {
  __$$_ChangeCopyWithImpl(_$_Change _value, $Res Function(_$_Change) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_Change(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Change implements _Change {
  const _$_Change(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'HomeTabEvent.change(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Change &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCopyWith<_$_Change> get copyWith =>
      __$$_ChangeCopyWithImpl<_$_Change>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TabItem tab) add,
    required TResult Function(TabItem tab) remove,
    required TResult Function(int index) change,
    required TResult Function(int oldIndex, int newIndex) reorder,
  }) {
    return change(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TabItem tab)? add,
    TResult? Function(TabItem tab)? remove,
    TResult? Function(int index)? change,
    TResult? Function(int oldIndex, int newIndex)? reorder,
  }) {
    return change?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TabItem tab)? add,
    TResult Function(TabItem tab)? remove,
    TResult Function(int index)? change,
    TResult Function(int oldIndex, int newIndex)? reorder,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Change value) change,
    required TResult Function(_Reorder value) reorder,
  }) {
    return change(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Change value)? change,
    TResult? Function(_Reorder value)? reorder,
  }) {
    return change?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Change value)? change,
    TResult Function(_Reorder value)? reorder,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(this);
    }
    return orElse();
  }
}

abstract class _Change implements HomeTabEvent {
  const factory _Change(final int index) = _$_Change;

  int get index;
  @JsonKey(ignore: true)
  _$$_ChangeCopyWith<_$_Change> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReorderCopyWith<$Res> {
  factory _$$_ReorderCopyWith(
          _$_Reorder value, $Res Function(_$_Reorder) then) =
      __$$_ReorderCopyWithImpl<$Res>;
  @useResult
  $Res call({int oldIndex, int newIndex});
}

/// @nodoc
class __$$_ReorderCopyWithImpl<$Res>
    extends _$HomeTabEventCopyWithImpl<$Res, _$_Reorder>
    implements _$$_ReorderCopyWith<$Res> {
  __$$_ReorderCopyWithImpl(_$_Reorder _value, $Res Function(_$_Reorder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldIndex = null,
    Object? newIndex = null,
  }) {
    return _then(_$_Reorder(
      null == oldIndex
          ? _value.oldIndex
          : oldIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == newIndex
          ? _value.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Reorder implements _Reorder {
  const _$_Reorder(this.oldIndex, this.newIndex);

  @override
  final int oldIndex;
  @override
  final int newIndex;

  @override
  String toString() {
    return 'HomeTabEvent.reorder(oldIndex: $oldIndex, newIndex: $newIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reorder &&
            (identical(other.oldIndex, oldIndex) ||
                other.oldIndex == oldIndex) &&
            (identical(other.newIndex, newIndex) ||
                other.newIndex == newIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldIndex, newIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReorderCopyWith<_$_Reorder> get copyWith =>
      __$$_ReorderCopyWithImpl<_$_Reorder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TabItem tab) add,
    required TResult Function(TabItem tab) remove,
    required TResult Function(int index) change,
    required TResult Function(int oldIndex, int newIndex) reorder,
  }) {
    return reorder(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TabItem tab)? add,
    TResult? Function(TabItem tab)? remove,
    TResult? Function(int index)? change,
    TResult? Function(int oldIndex, int newIndex)? reorder,
  }) {
    return reorder?.call(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TabItem tab)? add,
    TResult Function(TabItem tab)? remove,
    TResult Function(int index)? change,
    TResult Function(int oldIndex, int newIndex)? reorder,
    required TResult orElse(),
  }) {
    if (reorder != null) {
      return reorder(oldIndex, newIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Change value) change,
    required TResult Function(_Reorder value) reorder,
  }) {
    return reorder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Add value)? add,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Change value)? change,
    TResult? Function(_Reorder value)? reorder,
  }) {
    return reorder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Change value)? change,
    TResult Function(_Reorder value)? reorder,
    required TResult orElse(),
  }) {
    if (reorder != null) {
      return reorder(this);
    }
    return orElse();
  }
}

abstract class _Reorder implements HomeTabEvent {
  const factory _Reorder(final int oldIndex, final int newIndex) = _$_Reorder;

  int get oldIndex;
  int get newIndex;
  @JsonKey(ignore: true)
  _$$_ReorderCopyWith<_$_Reorder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeTabState {
  List<TabItem> get tabs => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeTabStateCopyWith<HomeTabState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeTabStateCopyWith<$Res> {
  factory $HomeTabStateCopyWith(
          HomeTabState value, $Res Function(HomeTabState) then) =
      _$HomeTabStateCopyWithImpl<$Res, HomeTabState>;
  @useResult
  $Res call({List<TabItem> tabs, int currentIndex});
}

/// @nodoc
class _$HomeTabStateCopyWithImpl<$Res, $Val extends HomeTabState>
    implements $HomeTabStateCopyWith<$Res> {
  _$HomeTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      tabs: null == tabs
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeTabStateCopyWith<$Res>
    implements $HomeTabStateCopyWith<$Res> {
  factory _$$_HomeTabStateCopyWith(
          _$_HomeTabState value, $Res Function(_$_HomeTabState) then) =
      __$$_HomeTabStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TabItem> tabs, int currentIndex});
}

/// @nodoc
class __$$_HomeTabStateCopyWithImpl<$Res>
    extends _$HomeTabStateCopyWithImpl<$Res, _$_HomeTabState>
    implements _$$_HomeTabStateCopyWith<$Res> {
  __$$_HomeTabStateCopyWithImpl(
      _$_HomeTabState _value, $Res Function(_$_HomeTabState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabs = null,
    Object? currentIndex = null,
  }) {
    return _then(_$_HomeTabState(
      tabs: null == tabs
          ? _value._tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<TabItem>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeTabState implements _HomeTabState {
  const _$_HomeTabState(
      {required final List<TabItem> tabs, required this.currentIndex})
      : _tabs = tabs;

  final List<TabItem> _tabs;
  @override
  List<TabItem> get tabs {
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabs);
  }

  @override
  final int currentIndex;

  @override
  String toString() {
    return 'HomeTabState(tabs: $tabs, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeTabState &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tabs), currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeTabStateCopyWith<_$_HomeTabState> get copyWith =>
      __$$_HomeTabStateCopyWithImpl<_$_HomeTabState>(this, _$identity);
}

abstract class _HomeTabState implements HomeTabState {
  const factory _HomeTabState(
      {required final List<TabItem> tabs,
      required final int currentIndex}) = _$_HomeTabState;

  @override
  List<TabItem> get tabs;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$_HomeTabStateCopyWith<_$_HomeTabState> get copyWith =>
      throw _privateConstructorUsedError;
}
