import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodolist/core/core.dart';

class TodoBloc extends Cubit<Result<List<TodoData>>> {
  late TodoRepository? _repository;

  TodoBloc({TodoRepository? repository}) : super(Result.idle()) {
    _repository = repository ?? sl<TodoRepository>();
  }

  Future<void> getAllData() async {
    emit(Result.isLoading());
    await _repository?.open();
    final listData = await _repository?.getAll();
    emit(Result.isSuccess(data: listData));
  }

  Future<TodoData?> saveData(String text) async {
    if(text.isEmpty) return null;
    final todo = TodoData(
        note: text,
        isComplete: false,
        createdAt: DateTime.now().toString()
    );
    final todoRepository = TodoRepository();
    await todoRepository.open();
    await todoRepository.insert(todo);
    todoRepository.close();
    return todo;
  }

  Future<void> update(TodoData todo) async {
    todo.isComplete = true;
    final todoRepository = TodoRepository();
    await todoRepository.open();
    await todoRepository.update(todo);
    todoRepository.close();
  }

  Future<void> deleteCompleteTask() async {
    final todoRepository = TodoRepository();
    await todoRepository.open();
    await todoRepository.deleteComplete();
    todoRepository.close();
  }
}