import 'package:coloropacityapp/bloc/imagepicker_bloc/imagepicker_bloc.dart';
import 'package:coloropacityapp/bloc/switch_bloc/switch_bloc.dart';
import 'package:coloropacityapp/bloc/todo/todo_bloc.dart';
import 'package:coloropacityapp/ui/todo/todo.screen.dart';
import 'package:coloropacityapp/utiles/imagepicker.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(
          create: (_) => ImagePickerBloc(
            MyImagePicker(),
          ),
        ),
        BlocProvider(create: (_) => TodoBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoListScreen(),
      ),
    );
  }
}
