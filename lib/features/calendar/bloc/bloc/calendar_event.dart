part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class CalendarDateTap extends CalendarEvent {
  const CalendarDateTap(this.birthdate);

  final DateTime birthdate;

  @override
  List<Object> get props => [birthdate];
}

class LoadTasksCalendar extends CalendarEvent {
  const LoadTasksCalendar();

  @override
  List<Object> get props => [];
}
