import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_manager/models/task.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper extends ChangeNotifier{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper._internal();
    }
    return _databaseHelper;
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async{
    if(_database == null){
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

  Future<List<Map<String, dynamic>>> getTasks() async {
    var db = await _getDatabase();
    var result = await db.query("tasks");
    return result;
  }

  Future<List<Task>> getTaskList() async{
    List<Task> taskList = List<Task>();
    var map = await getTasks();
    map.forEach((task) => taskList.add(Task.fromMap(task)));
    return taskList;
  }

  Future<int> createTask(Task task) async {
    var db = await _getDatabase();
    var result = await db.insert("tasks", task.toMap());
    return result;
  }


  Future<int> updateTask(Task task) async{
    var db = await _getDatabase();
    var result = await db.update("tasks", task.toMap(), where: "taskId = ?", whereArgs: [task.taskID]);
    return result;
  }

  Future<int> deleteTask(Task task) async{
    var db = await _getDatabase();
    var result = await db.delete("tasks", where: "taskId = ?", whereArgs: [task.taskID]);
    return result;
  }

  Future<int> deleteTasks() async{
    var db = await _getDatabase();
    var result = await db.delete("tasks");
    return result;
  }
}