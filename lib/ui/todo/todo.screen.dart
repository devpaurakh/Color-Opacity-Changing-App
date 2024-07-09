import 'package:coloropacityapp/bloc/todo/todo_bloc.dart';
import 'package:coloropacityapp/bloc/todo/todo_event.dart';
import 'package:coloropacityapp/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Center(
              child: Text("No Todos Found"),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.todosList[index]
                    ),
                    subtitle: const Text("Learning Bloc"),
                    trailing: IconButton(
                      onPressed: () {

                         context.read<TodoBloc>().add(DeleteTodoEvent(task: state.todosList[index] ));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         for (var i = 0; i < 5; i++) {

           context.read<TodoBloc>().add(AddTodoEvents(task: "task: $i"));
         }
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
