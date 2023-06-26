import 'package:cubit_app/components/builr_todo_list.dart';
import 'package:cubit_app/cubit/todo_cubit.dart';
import 'package:cubit_app/cubit/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TodoCubit cubit;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<TodoCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula Cubit'),
      ),
      body: Stack(
        children: [
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state is InitialTodoState) {
                return const Center(
                  child: Text('Nenhuma tarefa foi adicionada...'),
                );
              } else if (state is LoadingTodoState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedTodoState) {
                return BuildTodoList(todos: state.todos);
              } else {
                return BuildTodoList(todos: cubit.todos, cubit: cubit);
              }
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(hintText: 'Digite um nome'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        cubit.addTodo(todo: _nameController.text);
                        _nameController.clear();
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
