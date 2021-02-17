import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/screens/create_new_task.dart';
import 'package:task_manager/utils/database_helper.dart';
import 'package:task_manager/widgets/home/homepage_body.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  TaskBloc taskBloc;
  String flag;

  Homepage({@required this.flag});

  @override
  Widget build(BuildContext context) {
    taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(GetTasksEvent());
    return Provider(
      create: (_) => DatabaseHelper(),
      child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => addNewTask(context),
          ),
          body: HomepageBody(context: context,)
      ),
    );
  }

  void addNewTask(BuildContext context) async {
    Task task = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateNewTask()));
    if(task != null){
      taskBloc.add(CreateTaskEvent(task: task));
      taskBloc.add(GetTasksEvent());
    }
  }
}