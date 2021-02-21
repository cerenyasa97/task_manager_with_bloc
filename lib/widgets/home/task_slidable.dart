import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/screens/create_new_task.dart';
import 'package:task_manager/utils/constants.dart';
import 'task_card.dart';

// Task cards slide from left to right to create a slidable menu
// Slidable menu contains two actions, delete and update.
class TaskSlidable extends StatelessWidget {

  final index;

  TaskSlidable({@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state){
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: TaskCard(index: index),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red.shade500,
                icon: Icons.delete,
                onTap: () {
                  BlocProvider.of<TaskBloc>(context).add(DeleteTaskWithIDEvent(taskID: (state as GetTaskState).taskList[index].taskID));
                  BlocProvider.of<TaskBloc>(context).add(GetTasksEvent());
                },
              ),
              IconSlideAction(
                caption: 'Update',
                color: Constants.lightGrey,
                icon: Icons.update,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewTask(task: (state as GetTaskState).taskList[index])));
                },
              ),
            ],
          );
        }
    );
  }
}