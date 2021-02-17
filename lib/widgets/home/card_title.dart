import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';

class CardTitle extends StatelessWidget {

  final int index;

  CardTitle({@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state){
          return Flexible(
            child: Text(
              (state as GetTaskState).taskList[index].taskTitle,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 1/22,
              ),
            ),
          );
        }
    );
  }
}
