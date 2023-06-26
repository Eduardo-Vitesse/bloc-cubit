import 'package:cubit_app/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';

class BuildTodoList extends StatelessWidget {
  const BuildTodoList({super.key, required this.todos, this.cubit});

  final TodoCubit? cubit;
  final List<String> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (_, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Center(
              child: Text(todos[index][0]),
            ),
          ),
          title: Text(todos[index]),
          trailing: IconButton(
            onPressed: () {
              cubit?.removeTodo(index: index);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
