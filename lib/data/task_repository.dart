import 'package:task_manager/locator/service_locator.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/utils/database_helper.dart';

class TaskRepository{

  DatabaseHelper databaseHelper = locator<DatabaseHelper>();

  createWeather(Task task) async {
    int result = await databaseHelper.createTask(task);
    if(result == 0){
      throw Exception("The task could not be saved to the database.");
    }
  }

  Future<List<Task>> getTasks(String date) async{
    List<Task> taskList = await databaseHelper.getTaskList(date);
    if(taskList == null){
      throw Exception("An error occurred while reading tasks.");
    }
    return taskList;
  }

  Future<int> updateTask(Task task) async{
    int result = await databaseHelper.updateTask(task);
    if(result <= 0){
      throw Exception("Update error occurred please try again.");
    }
    return result;
  }

  Future<int> deleteTaskWithID(int taskID) async{
    int result = await databaseHelper.deleteTask(taskID);
    if(result == 0 | null){
      throw Exception("Delete task error occured please try again.");
    }
    return result;
  }

  Future<int> deleteAllTasks()async{
    int result = await databaseHelper.deleteTasks();
    if(result == 1){
      throw Exception("Delete all task operation does not happen.");
    }
    return result;
  }
}