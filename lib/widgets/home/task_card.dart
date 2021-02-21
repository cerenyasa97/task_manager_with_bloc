import 'package:flutter/material.dart';
import 'package:task_manager/utils/constants.dart';
import 'card_title.dart';
import 'is_done_check.dart';
import 'priority.dart';
import 'task_information.dart';

// Structure of each task card
// ignore: must_be_immutable
class TaskCard extends StatelessWidget {
  final index;
  BoxDecoration _boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Constants.lightGrey,
      ),
      borderRadius: BorderRadius.circular(20)
  );

  TaskCard({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 1/200),
      decoration: _boxDecoration,
      child: ExpansionTile(
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IsDoneCheck(index: index),
            CardTitle(index: index),
          ],
        ),
        children: [
          TaskInformation(index: index),
        ],
        trailing: Priority(index: index,),
      ),
    );
  }
}
