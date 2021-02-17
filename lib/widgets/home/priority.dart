import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/utils/constants.dart';

class Priority extends StatelessWidget {

  final int index;

  Priority({@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state){
          return Stack(
            children: [
              Icon(
                Icons.star,
                size: 30,
                color: Constants.priorityShade((state as GetTaskState).taskList[index].priority),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 1/200,
                left: MediaQuery.of(context).size.width * 1/150,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          );
        }
    );
  }
}
