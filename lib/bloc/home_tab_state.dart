part of 'home_tab_bloc.dart';

const freezed = Freezed(
    equal: true,
    copyWith: true,
    toStringOverride: true,
    makeCollectionsUnmodifiable: true);

@freezed
class HomeTabState with _$HomeTabState {
  const factory HomeTabState({
    required List<TabItem> tabs,
    required int currentIndex,
  }) = _HomeTabState;

  factory HomeTabState.initial({TabItem? init}) => HomeTabState(
        tabs: init == null ? [] : [init],
        currentIndex: -1,
      );
}
