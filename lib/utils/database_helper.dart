import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_manager/models/priority_color.dart';
import 'package:task_manager/models/task.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper extends ChangeNotifier {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper(){
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
    }
    return _databaseHelper;
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
    }
    notifyListeners();
    return _database;
  }

  Future<Database> _initializeDatabase() async {
    var lock = Lock();
    Database _db;

    if (_db == null) {
      await lock.synchronized(() async {
        if (_db == null) {
          var databasesPath = await getDatabasesPath();
          var path = join(databasesPath, "appDB.db");
          var file = new File(path);

          if (!await file.exists()) {
            // Copy from asset
            ByteData data =
            await rootBundle.load(join("assets", "tasks.db"));
            List<int> bytes =
            data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
            await new File(path).writeAsBytes(bytes);
          }

          _db = await openDatabase(path);
        }
      });
    }
    return _db;
  }

  Future<List<Map<String, dynamic>>> getTasks(String date, int isDone) async {
    var db = await _getDatabase();
    var result;
    if(date == null){
        if(isDone == null){
          result = await db.rawQuery("SELECT * FROM tasks INNER JOIN priority_colors ON tasks.priority == priority_colors.priority ORDER BY startDate ASC, startTime ASC, endDate DESC, endTime ASC");
        }
        else if(isDone == 0){
          result = await db.rawQuery("SELECT * FROM tasks INNER JOIN priority_colors ON tasks.priority == priority_colors.priority WHERE isDone == 0 ORDER BY startDate ASC, startTime ASC, endDate DESC, endTime ASC");
        }
        else{
          result = await db.rawQuery("SELECT * FROM tasks INNER JOIN priority_colors ON tasks.priority == priority_colors.priority WHERE isDone == 1 ORDER BY startDate ASC, startTime ASC, endDate DESC, endTime ASC");
        }
      }
      else{
        if(isDone == null){
          result = await db.rawQuery('SELECT * FROM tasks INNER JOIN priority_colors ON tasks.priority == priority_colors.priority WHERE startDate == "' + date + '" OR (startDate <= "' + date + '" AND endDate >= "' + date + '") ORDER BY startDate ASC, startTime ASC, endDate ASC, endTime ASC');
        }
        else if(isDone == 0){
          result = await db.rawQuery('SELECT * FROM tasks INNER JOIN priority_colors ON tasks.priority == priority_colors.priority WHERE startDate == "' + date + '" OR (startDate <= "' + date + '" AND endDate >= "' + date + '") AND isDone == 0 ORDER BY startDate ASC, startTime ASC, endDate ASC, endTime ASC');
        }
        else{
          result = await db.rawQuery('SELECT * FROM tasks INNER JOIN priority_colors ON tasks.priority == priority_colors.priority WHERE startDate == "' + date + '" OR (startDate <= "' + date + '" AND endDate >= "' + date + '") AND isDone == 1 ORDER BY startDate ASC, startTime ASC, endDate ASC, endTime ASC');
        }
    }
    return result;
  }

  Future<List<Task>> getTaskList(String date, int isDone) async {
    List<Task> taskList = List<Task>();
    var map = await getTasks(date, isDone);
    map.forEach((task) => taskList.add(Task.fromMap(task)));
    return taskList;
  }

  Future<int> createTask(Task task) async {
    var db = await _getDatabase();
    var result = await db.insert("tasks", task.toMap());
    return result;
  }


  Future<int> updateTask(Task task) async {
    var db = await _getDatabase();
    var result = await db.update(
        "tasks", task.toMap(), where: "taskId = ?", whereArgs: [task.taskID]);
    return result;
  }

  Future<int> deleteTask(int taskID) async {
    var db = await _getDatabase();
    var result = await db.delete(
        "tasks", where: "taskId = ?", whereArgs: [taskID]);
    return result;
  }

  Future<int> deleteTasks() async {
    var db = await _getDatabase();
    var result = await db.delete("tasks");
    return result;
  }

  Future<List<Map<String, dynamic>>> getPriorityColors() async{
    var db = await _getDatabase();
    var result = await db.query("priority_colors");
    return result;
  }

  Future<List<PriorityColor>> getPriorityColor() async {
    List<PriorityColor> priorityColorList = List<PriorityColor>();
    var map = await getPriorityColors();
    map.forEach((color) => priorityColorList.add(PriorityColor.fromMap(color)));
    return priorityColorList;
  }

  Future<int> updatePriorityColor(PriorityColor priorityColor) async {
    var db = await _getDatabase();
    var result = await db.update(
        "priority_colors", priorityColor.toMap(), where: "priority = ?", whereArgs: [priorityColor.priority]);
    return result;
  }
}