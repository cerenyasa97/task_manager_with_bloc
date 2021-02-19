import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/utils/constants.dart';
import 'package:date_time_format/date_time_format.dart';

// ignore: must_be_immutable
class HomeDateCards extends StatefulWidget {
  final int index;
  BuildContext context;

  HomeDateCards({@required this.index, @required this.context});

  @override
  _HomeDateCardsState createState() => _HomeDateCardsState();
}

class _HomeDateCardsState extends State<HomeDateCards> {
  @override
  Widget build(BuildContext context) {
    context = this.widget.context;
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 11 / 60,
        height: MediaQuery.of(context).size.height * 1 / 7,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 1 / 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(MediaQuery.of(context).size.width * 1 / 20),
          border: Border.all(
              color: Constants.lightGrey,
              width: MediaQuery.of(context).size.width * 1 / 120),
        ),
        child: Padding(
          padding:
          widget.index == 0 ? EdgeInsets.only(top: MediaQuery.of(context).size.height * 1 / 45) : EdgeInsets.only(top: MediaQuery.of(context).size.height * 1 / 75),
          child: Column(
            children: [
              Text(
                widget.index == 0 ? "All Tasks" : (DateTime.now().day + widget.index - 1).toString(),
                style: TextStyle(
                    fontSize: widget.index == 0 ? MediaQuery.of(context).size.width * 1 / 18 : MediaQuery.of(context).size.width * 1 / 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.index == 0 ? " " : Constants.getCurrentMonth(DateTime.now().month - 1),
                style: TextStyle(
                    fontSize: widget.index == 0 ? 0 : MediaQuery.of(context).size.width * 1 / 20,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        taskBloc.add(GetTasksEvent(date: widget.index == 0 ? null : DateTime.now().format("Y-m-") + "${DateTime.now().day+widget.index - 1}"));
      },
    );
  }
}