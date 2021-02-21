class PriorityColor{
  int priority;
  String color;

  PriorityColor(this.priority, this.color);

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["priority"] = priority;
    map["color"] = color.toString();
    return map;
  }

  PriorityColor.fromMap(Map<String, dynamic> map){
    this.priority = map["priority"];
    this.color = map["color"];
  }

  @override
  String toString() {
    return 'PriorityColor{priority: $priority, color: $color}';
  }
}