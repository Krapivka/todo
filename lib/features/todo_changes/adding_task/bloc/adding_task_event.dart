part of 'adding_task_bloc.dart';

sealed class AddingTaskEvent extends Equatable {
  const AddingTaskEvent();

  @override
  List<Object> get props => [];
}

class AddingTaskTitleChanged extends AddingTaskEvent {
  const AddingTaskTitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

// class AddingTaskImageTap extends AddingTaskEvent {
//   const AddingTaskImageTap();

//   @override
//   List<Object> get props => [];
// }

class AddingTaskDateTap extends AddingTaskEvent {
  const AddingTaskDateTap(this.dateTime);

  final DateTime dateTime;

  @override
  List<Object> get props => [dateTime];
}

final class AddingTaskSubmitted extends AddingTaskEvent {
  const AddingTaskSubmitted();
}
