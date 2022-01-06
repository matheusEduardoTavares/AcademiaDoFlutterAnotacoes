import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/home_page.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository_impl.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service_impl.dart';

class HomeModule extends TodoListModule {
  HomeModule() : super(
    routers: {
      '/home': (context) => HomePage(homeController: context.read(),),
    },
    bindings: [
      Provider<TasksRepository>(
        create: (context) => TasksRepositoryImpl(sqliteConnectionFactory: context.read())
      ),
      Provider<TasksService>(
        create: (context) => TasksServiceImpl(tasksRepository: context.read())
      ),
      ChangeNotifierProvider(
        create: (context) => HomeController(tasksService: context.read(), todayTotalTasks: context.read()),
      )
    ],
  );
  
}