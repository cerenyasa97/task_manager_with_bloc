import 'package:flutter/material.dart';
import 'date_and_time.dart';
import 'task_description.dart';

class TaskInformation extends StatelessWidget {

  final int index;

  TaskInformation({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateAndTime(title: "Start", index: index),
        SizedBox(height: MediaQuery.of(context).size.height * 1/80,),
        DateAndTime(title: "End", index: index),
        SizedBox(height: MediaQuery.of(context).size.height * 1/80,),
        TaskDescription(index: index),
        SizedBox(height: MediaQuery.of(context).size.height * 1/80,)
      ],
    );
  }
}
