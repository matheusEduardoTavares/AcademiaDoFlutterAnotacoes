import 'package:dart_desafio/desafio/models/state_model.dart';

abstract class StateService {
  Future<List<StateModel>?> getStates();

  Future<void> createStates({
    required List<StateModel> states,
  });
}