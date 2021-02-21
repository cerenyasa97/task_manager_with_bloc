class Task{
  int taskID;
  String taskTitle;
  String taskDescription;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  String priorityColor;
  int priority;
  int isDone;

  Task(this.taskTitle, this.taskDescription, this.startDate, this.startTime, this.endDate, this.endTime, this.priority, this.isDone);

  Task.withID(this.taskID, this.taskTitle, this.taskDescription, this.startDate, this.startTime, this.endDate, this.endTime, this.priority, this.isDone);

  Map<String, dynamic> toMap (){
    var map = Map<String, dynamic>();
    map["taskID"] = taskID;
    map["taskTitle"] = taskTitle;
    map["taskDescription"] = taskDescription;
    map["startDate"] = startDate;
    map["startTime"] = startTime;
    map["endDate"] = endDate;
    map["endTime"] = endTime;
    map["priority"] = priority;
    map["isDone"] = isDone;
    return map;
  }

  Task.fromMap(Map<String, dynamic> map){
    this.taskID = map["taskID"];
    this.taskTitle = map["taskTitle"];
    this.taskDescription = map["taskDescription"];
    this.startDate = map["startDate"];
    this.startTime = map["startTime"];
    this.endDate = map["endDate"];
    this.endTime = map["endTime"];
    this.priority = map["priority"];
    this.priorityColor = map["color"];
    this.isDone = map["isDone"];
  }

  @override
  String toString() {
    return 'Task{taskID: $taskID, taskTitle: $taskTitle, taskDescription: $taskDescription, startDate: $startDate, startTime: $startTime, endDate: $endDate, endTime: $endTime, priority: $priority, isDone: $isDone, color: $priorityColor}';
  }
}