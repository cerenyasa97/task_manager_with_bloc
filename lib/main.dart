import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/screens/first_page.dart';
import 'package:task_manager/utils/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => DatabaseHelper(),
        child: FirstPage(),
      ),
    );
  }
}