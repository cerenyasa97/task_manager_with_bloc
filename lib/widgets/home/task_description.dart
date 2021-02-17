import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';

class TaskDescription extends StatelessWidget {
  final int index;

  TaskDescription({@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      final String taskDescription =
          (state as GetTaskState).taskList[index].taskDescription;
      return taskDescription == " "
          ? Container()
          : Column(
              children: [
                Text(
                  "Task Description",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 1 / 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 80,
                ),
                Text(
                  taskDescription,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 1 / 27),
                ),
              ],
            );
    });
  }
}
