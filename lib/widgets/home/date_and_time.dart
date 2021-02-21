import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';

// Shows start and end date and time
class DateAndTime extends StatelessWidget {
  final String title;
  final int index;

  DateAndTime({@required this.title, @required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 1/23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 1/100,),
                  Row(
                    children: [
                      Text(
                        title == "Start" ? (state as GetTaskState).taskList[index].startDate : (state as GetTaskState).taskList[index].endDate,
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 1/27),
                      ),
                      Text("\t"),
                      Text(
                        title == "Start" ? (state as GetTaskState).taskList[index].startTime : (state as GetTaskState).taskList[index].endTime,
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width * 1/27),
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        }
    );
  }
}
