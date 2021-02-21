import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:task_manager/bloc/task/task_bloc.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/utils/constants.dart';
import 'package:date_format/date_format.dart';

class CreateNewTask extends StatefulWidget {

  final task;

  CreateNewTask({this.task});

  @override
  _CreateNewTaskState createState() => _CreateNewTaskState();
}


// Structure of create or update tasks
class _CreateNewTaskState extends State<CreateNewTask> {
  Widget _separate; // Adds space between widgets
  String _priorityValue; // _priorityValue value of priority dropdown menu button
  var _startDate, _endDate; // Task start and end dates and times
  var _taskTitleController, _taskDescriptionController;
  Task task;
  TaskBloc taskBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskTitleController = TextEditingController();
    _taskDescriptionController = TextEditingController();
    _taskDescriptionController.text = " ";
    task = widget.task;
    _priorityValue = Constants.priority[0];

    // If the task is to be updated, the parameters of the task are applied to the required widgets
    if (task != null) {
      _taskTitleController.text = task.taskTitle;
      _taskDescriptionController.text = task.taskDescription;
      _startDate =
          DateTime.parse(task.startDate + " " + task.startTime);
      _endDate = DateTime.parse(task.endDate + " " + task.endTime);
      _priorityValue = task.priority.toString();
    }
  }

  @override
  Widget build(BuildContext context) {

    taskBloc = BlocProvider.of<TaskBloc>(context);

    _separate = SizedBox(
      height: MediaQuery.of(context).size.height * 1 / 40,
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          background(context),
          formDesign(context),
          buttons(context),
        ],
      ),
    );
  }

  // Set background image
  Widget background(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/background3.png",
        ),
      ),
    );
  }

  // Form widget design
  Widget formDesign(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _separate,
          labels("Task Title"),
          _separate,
          titleField(),
          _separate,
          labels("TaskDescription"),
          _separate,
          descriptionField(),
          _separate,
          dateTimeField(context),
          _separate,
          priorityField(context),
        ],
      ),
    );
  }

  // Save and cancel buttons
  Widget buttons(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 1 / 15,
      left: MediaQuery.of(context).size.width * 3 / 10,
      child: ButtonBar(
        children: [
          cancelButton(),
          saveButton(),
        ],
      ),
    );
  }

  // Keeps the labels of each widget
  Widget labels(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }

  // Widget design that takes the task title from the user
  Widget titleField() {
    return TextField(
      controller: _taskTitleController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Enter task title",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20))),
    );
  }

  // Widget design that takes the task description from the user
  Widget descriptionField() {
    return TextField(
      controller: _taskDescriptionController,
      maxLines: 3,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Enter task description",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20))),
    );
  }

  // Designs widgets for task start and end values
  dateTimeField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        startDateEditing(context),
        endDateEditing(context),
      ],
    );
  }

  // Priority dropdown button design
  Widget priorityField(BuildContext context) {
    return Center(
      child: Column(
        children: [
          labels("Priority"),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: DropdownButton<String>(
                    value: _priorityValue,
                    onChanged: (value) {
                      setState(() {
                        _priorityValue = value;
                      });
                    },
                    items: Constants.priority.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )),
          )
        ],
      ),
    );
  }

  // Warns the user in case of incorrect information entry
  void showAlert(title, content) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        RaisedButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    // Shows the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // Cancels the update or save process
  Widget cancelButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blueGrey)),
      child: Text(
        "Cancel",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  // Updates an existing task or saves a new task
  Widget saveButton() {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blueGrey)),
        child: Text(
          "Save",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: saveButtonPressed
    );
  }

  // Designs widgets for task start date and time selection
  Widget startDateEditing(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          labels("Start"),
          RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blueGrey),
              ),
              child: Text(_startDate == null
                  ? "Date"
                  : "${_startDate.day}/${_startDate.month}/${_startDate.year} ${_startDate.hour}:" +
                  (_startDate.minute < 10
                      ? "0${_startDate.minute}"
                      : _startDate.minute.toString())),
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2050, 12, 31),
                    onConfirm: (date) {
                      setState(() {
                        _startDate = date;
                      });
                    });
              }),
        ],
      ),
    );
  }

  // Designs widgets for task end date and time selection
  Widget endDateEditing(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          labels("End"),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.blueGrey)),
              child: Text(_endDate == null
                  ? "Date"
                  : "${_endDate.day}/${_endDate.month}/${_endDate.year} ${_endDate.hour}:" +
                  (_endDate.minute < 10
                      ? "0${_endDate.minute}"
                      : _endDate.minute.toString())),
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    minTime: _startDate,
                    maxTime: DateTime(2050, 12, 31), onConfirm: (date) {
                      setState(() {
                        _endDate = date;
                      });
                    });
              }),
        ],
      ),
    );
  }

  void saveButtonPressed() async{
    if (task == null) {
      if (_taskTitleController.text.length >= 3 &&
          _startDate != null &&
          _endDate != null) {
        taskBloc.add(CreateTaskEvent(task: Task(
            _taskTitleController.text,
            _taskDescriptionController.text,
            formatDate(_startDate, [yyyy, "-", mm, "-", dd]),
            formatDate(_startDate, [hh, ":", nn]),
            formatDate(_endDate, [yyyy, "-", mm, "-", dd]),
            formatDate(_endDate, [hh, ":", nn]),
            int.parse(_priorityValue),
            0)));
        taskBloc.add(GetTasksEvent());
        Navigator.of(context).pop();
      }
      else {
        showAlert("Attention",
            "Please check the input values. The task title must contain at least 3 characters. Start and end dates cannot be empty.");
      }
    }
    else{
      if (_taskTitleController.text.length >= 3 &&
          _startDate != null &&
          _endDate != null) {
        taskBloc.add(UpdateTaskEvent(task: Task.withID(
            task.taskID,
            _taskTitleController.text,
            _taskDescriptionController.text,
            formatDate(_startDate, [yyyy, "-", mm, "-", dd]),
            formatDate(_startDate, [hh, ":", nn]),
            formatDate(_endDate, [yyyy, "-", mm, "-", dd]),
            formatDate(_endDate, [hh, ":", nn]),
            int.parse(_priorityValue),
            task.isDone)));
        taskBloc.add(GetTasksEvent());
        Navigator.of(context).pop();
      }
      else {
        showAlert("Attention",
            "Please check the input values. The task title must contain at least 3 characters. Start and end dates cannot be empty.");
      }
    }
  }
}