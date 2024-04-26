part of 'update_task_bloc.dart';

enum UpdateTaskStatus {
  initial,
  loading,
  success,
  failure,
  validatorFailure,
}

final currentDate = DateTime.now();

class UpdateTaskState extends Equatable {
  UpdateTaskState({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.status = UpdateTaskStatus.initial,
    dateTime,
  }) : dateTime = dateTime ?? DateTime.now();

  UpdateTaskState.taskModel({required TaskModel task})
      : title = task.title,
        dateTime = task.dateTime,
        status = UpdateTaskStatus.initial,
        description = task.description ?? '',
        id = task.id;

  final UpdateTaskStatus status;
  final int id;
  final String description;
  final String title;
  final DateTime dateTime;
  @override
  List<Object> get props => [status, id, title, description, dateTime];

  UpdateTaskState copyWith(
      {UpdateTaskStatus? status,
      int? id,
      String? title,
      String? description,
      DateTime? dateTime}) {
    return UpdateTaskState(
      id: id ?? this.id,
      description: description ?? this.description,
      status: status ?? this.status,
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
