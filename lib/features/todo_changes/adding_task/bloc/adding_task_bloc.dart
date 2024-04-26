import 'dart:async';

import 'package:todo/core/data/models/task.dart';
import 'package:todo/core/services/notification/notification_service.dart';
import 'package:todo/core/domain/repositories/task_repository.dart';
import 'package:todo/features/settings/data/repository/abstract_settings_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adding_task_event.dart';
part 'adding_task_state.dart';

class AddingTaskBloc extends Bloc<AddingTaskEvent, AddingTaskState> {
  AddingTaskBloc(this._taskRepository, this._settingsRepository)
      : super(AddingTaskState()) {
    on<AddingTaskTitleChanged>(_onNameChanged);
    on<AddingTaskDateTap>(_onDateTap);
    // on<AddingTaskImageTap>(_onImageTap);
    on<AddingTaskSubmitted>(_onSubmitted);
  }

  final AbstractTaskRepository _taskRepository;
  final AbstractSettingsRepository _settingsRepository;
  //final AppImagePicker _imagePicker;

  // void _onImageTap(
  //     AddingTaskImageTap event, Emitter<AddingTaskState> emit) async {
  //   final File? file = await AppImagePickerService.getImageFromGallery();

  //   emit(state.copyWith(file: file));
  // }

  void _onNameChanged(
      AddingTaskTitleChanged event, Emitter<AddingTaskState> emit) {
    debugPrint("Name: ${event.title}");
    emit(state.copyWith(title: event.title));
  }

  void _onDateTap(AddingTaskDateTap event, Emitter<AddingTaskState> emit) {
    debugPrint("Date: ${event.dateTime}");
    emit(state.copyWith(dateTime: event.dateTime));
  }

  void _onSubmitted(
      AddingTaskSubmitted event, Emitter<AddingTaskState> emit) async {
    emit(state.copyWith(status: AddingTaskStatus.loading));

    try {
      if (state.title != '') {
        //preparing the model for creation
        final lastInd = await _taskRepository.lastIndex();
        TaskModel task = TaskModel(
          id: lastInd + 1,
          description: state.description,
          title: state.title,
          dateTime: state.dateTime,
        );

        //adding to the local storage
        await _taskRepository.addTask(task);

        //scheduling notifications
        final notificationInterval =
            await _settingsRepository.getNotificationDayTime();
        notificationInterval.fold(
            (failure) => emit(state.copyWith(status: AddingTaskStatus.failure)),
            (result) async {
          final taskTime = state.dateTime;
          await NotificationService.scheduleTaskNotification(
              task: task,
              id: task.id,
              interval: result.day,
              dateTime: taskTime,
              hourNotif: result.hour,
              minuteNotif: result.minute);
        });

        debugPrint("Add new Task for: ${task.title}");
        emit(state.copyWith(status: AddingTaskStatus.success));
      } else {
        emit(state.copyWith(status: AddingTaskStatus.validatorFailure));
        emit(state.copyWith(status: AddingTaskStatus.initial));
      }
    } catch (e) {
      emit(state.copyWith(status: AddingTaskStatus.failure));
    } finally {
      Completer.sync().complete();
    }
  }
}
