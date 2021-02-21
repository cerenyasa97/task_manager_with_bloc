import 'package:task_manager/locator/service_locator.dart';
import 'package:task_manager/models/priority_color.dart';
import 'package:task_manager/utils/database_helper.dart';

class PriorityColorRepository{
  DatabaseHelper databaseHelper = locator<DatabaseHelper>();

  Future<List<PriorityColor>>  getPriorityColors() async{
    List<PriorityColor> colorList = await databaseHelper.getPriorityColor();
    if(colorList == null){
      throw Exception("Get color error");
    }
    return colorList;
  }

  Future<int> updatePriorityColor(PriorityColor priorityColor) async{
    int result = await databaseHelper.updatePriorityColor(priorityColor);
    if(result == null){
      throw Exception("Update priority color error!");
    }
    return result;
  }
}