import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/task_repository.dart';
import 'package:task_manager/locator/service_locator.dart';
import 'package:task_manager/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository = locator<TaskRepository>();

  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
      TaskEvent event,
      ) async* {
    if(event is CreateTaskEvent){
      try{
        final result = taskRepository.createWeather(event.task);
        yield TaskCreatedState(result: result);
      }catch(_){
        yield TaskCreateErrorState();
      }
    }

    else if(event is GetTasksEvent){
      yield GettingTaskState();
      try{
        final List<Task> taskList = await taskRepository.getTasks(event.date, event.isDone);
        yield GetTaskState(taskList: taskList);
      }
      catch(_){
        yield TaskGetErrorState();
      }
    }

    else if(event is UpdateTaskEvent){
      try{
        final result = await taskRepository.updateTask(event.task);
        yield UpdatedTaskState(result: result);
      }
      catch(_){
        yield UpdateTaskErrorState();
      }
    }

    else if(event is DeleteTaskWithIDEvent){
      try{
        await taskRepository.deleteTaskWithID(event.taskID);
        yield DeletedTaskState();
      }
      catch(_){
        yield DeleteTaskErrorState();
      }
    }

    else if(event is DeleteTasksEvent){
      try{
        await taskRepository.deleteAllTasks();
        yield DeletedAllTasksState();
      }
      catch(_){
        yield DeleteAllTasksErrorState();
      }
    }
  }
}

