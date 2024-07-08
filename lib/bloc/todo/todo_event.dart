import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();


}

class AddTodoEvents extends TodoEvent {
  final String task;

  const AddTodoEvents({required this.task});
  @override
  List<Object?> get props => [task];
}

class DeleteTodoEvent extends TodoEvent {

  final String task;

  const DeleteTodoEvent({required this.task});
  @override
  List<Object?> get props => [task];
}
