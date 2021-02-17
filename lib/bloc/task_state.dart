part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskCreatedState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TaskCreateErrorState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GettingTaskState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class GetTaskState extends TaskState{
  List<Task> taskList = List<Task>();

  GetTaskState({@required this.taskList});

  @override
  // TODO: implement props
  List<Object> get props => [taskList];
}

class TaskGetErrorState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UpdatedTaskState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class UpdateTaskErrorState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class DeletedTaskState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class DeleteTaskErrorState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class DeletedAllTasksState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class DeleteAllTasksErrorState extends TaskState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}