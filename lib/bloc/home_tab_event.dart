part of 'home_tab_bloc.dart';

@freezed
class HomeTabEvent with _$HomeTabEvent {
  const factory HomeTabEvent.add(TabItem tab) = _Add;

  const factory HomeTabEvent.remove(TabItem tab) = _Remove;

  const factory HomeTabEvent.change(int index) = _Change;

  const factory HomeTabEvent.reorder(int oldIndex, int newIndex) = _Reorder;
}
