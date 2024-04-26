part of 'home_cubit.dart';

enum HomeTab { tasks, calendar }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.tasks,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
