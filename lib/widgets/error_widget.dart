import 'package:flutter/material.dart';

// Widget used in case of an error while loading data from the database
class TaskErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Error occured! Please refresh..."),
    );
  }
}
