import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_manager/utils/constants.dart';
import 'task_card.dart';

class TaskSlidable extends StatelessWidget {

  final index;

  TaskSlidable({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: TaskCard(index: index),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red.shade500,
          icon: Icons.delete,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Update',
          color: Constants.lightGrey,
          icon: Icons.update,
          onTap: () {},
        ),
      ],
    );
  }
}
