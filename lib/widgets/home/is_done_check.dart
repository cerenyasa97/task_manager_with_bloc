import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';

class IsDoneCheck extends StatefulWidget {

  final index;

  IsDoneCheck({@required this.index});

  @override
  _IsDoneCheckState createState() => _IsDoneCheckState();
}

class _IsDoneCheckState extends State<IsDoneCheck> {
  int checkedValue;

  @override
  Widget build(BuildContext context) {
    TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    //checkedValue = (taskBloc.state as GetTaskState).taskList[widget.index].isDone;
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state){
          return Checkbox(
            value: (taskBloc.state as GetTaskState).taskList[widget.index].isDone == 0 ? false : true,
            onChanged: (newValue) {
              setState(() {
                (taskBloc.state as GetTaskState).taskList[widget.index].isDone = newValue ? 1 : 0;
              });
            },
          );
        }
    );
  }
}
