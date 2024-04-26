part of 'calendar_bloc.dart';

enum CalendarStatus { initial, loading, success, failure }

class CalendarState extends Equatable {
  CalendarState({
    this.status = CalendarStatus.initial,
    tasks,
    tasksInSelectedDay,
  })  : tasks = tasks ?? LinkedHashMap<DateTime, List<TaskModel>>(),
        tasksInSelectedDay = tasksInSelectedDay ?? [];

  final LinkedHashMap<DateTime, List<TaskModel>> tasks;
  final List<TaskModel> tasksInSelectedDay;
  final CalendarStatus status;
  final DateTime today = DateTime.now();

  DateTime get firstDay => DateTime(today.year, 1, 1);

  DateTime get lastDay =>
      DateTime(today.year, 12, DateTime(today.year + 1, 1, 0).day);

  @override
  List<Object> get props => [status, tasks, tasksInSelectedDay];

  CalendarState copyWith({
    LinkedHashMap<DateTime, List<TaskModel>>? tasks,
    List<TaskModel>? tasksInSelectedDay,
    CalendarStatus? status,
  }) {
    return CalendarState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      tasksInSelectedDay: tasksInSelectedDay ?? this.tasksInSelectedDay,
    );
  }
}
