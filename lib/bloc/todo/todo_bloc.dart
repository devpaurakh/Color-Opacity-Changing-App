import 'package:coloropacityapp/bloc/todo/todo_event.dart';
import 'package:coloropacityapp/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todosList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvents>(_addTodoEvents);
    on<DeleteTodoEvent>(_deleteTodoEvents);
  }

  void _addTodoEvents(AddTodoEvents event, Emitter<TodoState> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }


  void _deleteTodoEvents(DeleteTodoEvent event, Emitter<TodoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}
