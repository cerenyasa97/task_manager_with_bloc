import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'task_widget.dart';
import '../error_widget.dart';
import '../loading.dart';

// The structure where the tasks on the homepage are listed
// HomeBottomWidget is updated when GetTaskEvent is applied
class HomeBottomWidget extends StatelessWidget {

  final date;

  HomeBottomWidget({this.date});

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(GetTasksEvent(date: date));
    return BlocBuilder<TaskBloc,TaskState>(
      builder: (context, state){
        if (state is GettingTaskState){
          return LoadingWidget();
        }
        if (state is GetTaskState){
          return TaskWidget();
        }
        if (state is TaskGetErrorState){
          return TaskErrorWidget();
        }
        else{
          return Center(child: Text("Nothing found!"),);
        }
      },
    );
  }
}
