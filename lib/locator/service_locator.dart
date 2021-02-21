import 'package:get_it/get_it.dart';
import 'package:task_manager/data/priority_color_repository.dart';
import 'package:task_manager/data/task_repository.dart';
import 'package:task_manager/utils/database_helper.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => TaskRepository());
  locator.registerLazySingleton(() => DatabaseHelper());
  locator.registerLazySingleton(() => PriorityColorRepository());
}