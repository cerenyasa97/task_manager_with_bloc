part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class CreateTaskEvent extends TaskEvent{

  final Task task;

  CreateTaskEvent({@required this.task});

  @override
  // TODO: implement props
  List<Object> get props => [task];
}

class GetTasksEvent extends TaskEvent{

  final String date;

  GetTasksEvent({this.date});

  @override
  // TODO: implement props
  List<Object> get props => [date];
}

class UpdateTaskEvent extends TaskEvent{
  final Task task;

  UpdateTaskEvent({@required this.task});

  @override
  // TODO: implement props
  List<Object> get props => [task];
}

class DeleteTaskWithIDEvent extends TaskEvent{
  final int taskID;

  DeleteTaskWithIDEvent({@required this.taskID});

  @override
  // TODO: implement props
  List<Object> get props => [taskID];
}

class DeleteTasksEvent extends TaskEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}