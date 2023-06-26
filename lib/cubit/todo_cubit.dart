import 'package:bloc/bloc.dart';
import 'package:cubit_app/cubit/todo_states.dart';

class TodoCubit extends Cubit<TodoState> {
  final List<String> _todos = [];

  List<String> get todos => _todos;

  TodoCubit(super.initialState);

  final Future delay = Future.delayed(const Duration(seconds: 2));

  // Criando as funções para atualizar o estado da aplicação
  Future<void> addTodo({required String todo}) async {
    emit(LoadingTodoState());
    await delay;

    if (_todos.contains(todo)) {
      emit(ErrorTodoState('Você já adicionou essa tarefa...'));
    } else {
      _todos.add(todo);
      emit(LoadedTodoState(_todos));
    }
  }

  Future<void> removeTodo({required int index}) async {
    emit(LoadingTodoState());
    await delay;

    _todos.removeAt(index);

    emit(LoadedTodoState(_todos));
  }
}
