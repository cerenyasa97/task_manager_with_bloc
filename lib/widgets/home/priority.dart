import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'package:task_manager/widgets/error_widget.dart';

// ignore: must_be_immutable
class Priority extends StatelessWidget {

  final int index;
  var priorityValue;
  String priorityColor;

  Priority({@required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder:(context, taskState) {
          priorityValue = (taskState as GetTaskState).taskList[index].priority;
          priorityColor = (taskState as GetTaskState).taskList[index].priorityColor;
          if(taskState is GetTaskState){
            return Stack(
              children: [
                // Icon indicating the priority status of the tasks with colors determined by the user
                Icon(
                  Icons.star,
                  size: 30,
                  color: convertColor(),
                ),
                // Button to open task descriptions
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
          else{
            return TaskErrorWidget();
          }
          });
  }

  convertColor(){
    var color = priorityColor;
    var valueString = color.split('(0x')[1].split(')')[0];
    var value = int.parse(valueString, radix: 16);
    var otherColor = new Color(value);
    return otherColor;
  }
}