import 'package:cubit_app/cubit/todo_cubit.dart';
import 'package:cubit_app/cubit/todo_states.dart';
import 'package:cubit_app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(InitialTodoState()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
