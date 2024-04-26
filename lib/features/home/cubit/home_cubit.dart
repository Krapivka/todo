import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setTab(int index) {
    HomeTab tab = HomeTab.tasks;
    switch (index) {
      case 0:
        tab = HomeTab.tasks;
        break;
      case 1:
        tab = HomeTab.calendar;
        break;
    }
    emit(HomeState(tab: tab));
  }
}
