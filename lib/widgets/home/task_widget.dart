import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'task_slidable.dart';

class TaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, TaskState state){
          final returnedTaskList = (state as GetTaskState).taskList;
          return ListView.builder(
              itemCount: returnedTaskList.length,
              itemBuilder: (context, index){
                return TaskSlidable(index: index);
              });
        }
    );
  }
}
