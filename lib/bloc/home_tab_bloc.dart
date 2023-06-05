import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fterm/model/tab_item.dart';

part 'home_tab_event.dart';

part 'home_tab_state.dart';

part 'home_tab_bloc.freezed.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc({TabItem? init}) : super(HomeTabState.initial(init: init)) {
    on<HomeTabEvent>((event, emit) {
      event.map(
        add: (e) {
          List<TabItem> tabs = List.from(state.tabs);
          tabs.add(e.tab);
          emit(state.copyWith(tabs: tabs, currentIndex: tabs.length - 1));
        },
        remove: (e) {
          List<TabItem> tabs = List.from(state.tabs);
          tabs.remove(e.tab);
          int currentIndex = state.currentIndex;
          if (currentIndex > 0) currentIndex--;
          emit(state.copyWith(tabs: tabs, currentIndex: currentIndex));
        },
        change: (e) {
          if (e.index >= 0 && e.index < state.tabs.length) {
            emit(state.copyWith(currentIndex: e.index));
          }
        },
        reorder: (e) {
          int oldIndex = e.oldIndex;
          int newIndex = e.newIndex;
          int currentIndex = state.currentIndex;
          List<TabItem> tabs = List.from(state.tabs);
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = tabs.removeAt(oldIndex);
          tabs.insert(newIndex, item);
          if (currentIndex == newIndex) {
            currentIndex = oldIndex;
          } else if (currentIndex == oldIndex) {
            currentIndex = newIndex;
          }
          emit(state.copyWith(tabs: tabs, currentIndex: currentIndex));
        },
      );
    });
  }
}
