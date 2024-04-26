import 'package:todo/core/data/models/task.dart';
import 'package:todo/core/domain/enteties/task_entity.dart';
import 'package:todo/core/error/failure.dart';

import 'package:dartz/dartz.dart';

abstract class AbstractTaskRepository {
  Future<Either<Failure, void>> addTask(TaskEntity task);
  Future<Either<Failure, void>> deleteTask(int id);
  Future<Either<Failure, void>> updateTask(TaskModel task);
  Future<Either<Failure, List<TaskEntity>>> searchTask(String query);
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<int> lastIndex();
}
