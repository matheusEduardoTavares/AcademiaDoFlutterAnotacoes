class TotalTasksModel {
  TotalTasksModel({
    required this.totalTasks,
    required this.totalTasksFinish,
  });
  
  final int totalTasks;
  final int totalTasksFinish;  

  int get totalTasksUnfinish => totalTasks - totalTasksFinish;
}
