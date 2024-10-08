import 'package:coloropacityapp/bloc/favourite_bloc/favourite_app_bloc.dart';
import 'package:coloropacityapp/bloc/imagepicker_bloc/imagepicker_bloc.dart';
import 'package:coloropacityapp/bloc/product/product_bloc.dart';
import 'package:coloropacityapp/bloc/switch_bloc/switch_bloc.dart';
import 'package:coloropacityapp/bloc/todo/todo_bloc.dart';
import 'package:coloropacityapp/repository/favourite_repository.dart';
import 'package:coloropacityapp/ui/products/product.screen.dart';
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
        BlocProvider(create: (_) => FavouriteAppBloc(FavouriteRepository())),
        BlocProvider(create: (_) => ProductBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        home: const ProductScreen(),
      ),
    );
  }
}
