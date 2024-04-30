import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime dateTime;
  const TaskEntity({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [id, title, description, dateTime];
}
