import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensons.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/total_tasks_model.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';

class TodoCardFilter extends StatelessWidget {
  const TodoCardFilter({ 
    Key? key,
    required this.label,
    required this.taskFilter,
    required this.selected,
    this.totalTasksModel,
  }) : super(key: key);

  final String label;
  final TaskFilterEnum taskFilter;
  final TotalTasksModel? totalTasksModel;
  final bool selected;

  double _getPercentFinish() {
    final total = totalTasksModel?.totalTasks ?? 0.0;
    final totalFinish = totalTasksModel?.totalTasksFinish ?? 1.0;

    if (total == 0) {
      return 0.0;
    }

    final percent = (totalFinish * 100) / total;
    return percent / 100;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => 
        context.read<HomeController>().findTasks(filter: taskFilter),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 120,
          maxWidth: 150
        ),
        decoration: BoxDecoration(
          color: selected ? context.primaryColor : Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(.8),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 21,
            //   width: 21,
            //   child: CircularProgressIndicator(

            //   ),
            // ),
            Text(
              '${totalTasksModel?.totalTasksUnfinish ?? 0} TASKS',
              style: context.titleStyle.copyWith(
                fontSize: 10,
                color: selected ? Colors.white : Colors.grey,
              )
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
            TweenAnimationBuilder<double>(
              duration: Duration(seconds: 1),
              tween: Tween(
                begin: 0.0,
                end: _getPercentFinish(),
              ),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  backgroundColor: selected ? context.primaryColorLight : Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    selected ? Colors.white : context.primaryColor,
                  ),
                  value: value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}