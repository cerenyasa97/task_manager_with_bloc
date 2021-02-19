import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/screens/create_new_task.dart';
import 'package:task_manager/utils/constants.dart';
import 'package:task_manager/utils/database_helper.dart';
import 'package:task_manager/widgets/home/homepage_body.dart';
import 'package:task_manager/widgets/priority_color_page/priority_color_page.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  TaskBloc taskBloc;
  String date;

  Homepage({this.date});

  @override
  Widget build(BuildContext context) {
    taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(GetTasksEvent());
    return Provider(
      create: (_) => DatabaseHelper(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Constants.appColor,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.palette, color: Colors.white,),
                tooltip: "Priority Color",
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PriorityColorPicker()));
                },
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Completed Tasks"),
                    value: "completed",
                  ),
                  PopupMenuItem(
                    child: Text("Incomplete Tasks"),
                    value: "incomplete",
                  ),
                  PopupMenuItem(
                    child: Text("All Tasks"),
                    value: "all",
                  ),
                ],
                onSelected: (value){
                  if(value == "completed"){
                    taskBloc.add(GetTasksEvent(isDone: 1));
                  }
                  else if(value == "incomplete"){
                    taskBloc.add(GetTasksEvent(isDone: 0));
                  }
                  else{
                    taskBloc.add(GetTasksEvent());
                  }
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => addNewTask(context),
          ),
          body: HomepageBody(context: context, date: date)
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