part of 'example_freezed_bloc.dart';

@freezed
class ExampleFreezedEvent with _$ExampleFreezedEvent {
  factory ExampleFreezedEvent.findNames() = _ExampleFreezedEventFindNames;
  factory ExampleFreezedEvent.addName(String name) = _ExampleFreezedEventAddName;
  factory ExampleFreezedEvent.removeName(String name) = _ExampleFreezedEventRemoveName;
}