import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';

class TaskCreateController extends DefaultChangeNotifier {
  TaskCreateController({
    required TasksService tasksService,
  }) : _tasksService = tasksService;

  final TasksService _tasksService;
  DateTime? _selectedDate;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  Future<void> save(String description) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      
      if (_selectedDate != null) {
        await _tasksService.save(_selectedDate!, description);
        success();
      }
      else {
        setError('Data da task não selecionada');
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      setError('Erro ao cadastrar task');
    }
    finally {
      hideLoading();
      notifyListeners();
    }
  }
}