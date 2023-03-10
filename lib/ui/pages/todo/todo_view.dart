import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtodolist/core/core.dart';
import 'package:mtodolist/ui/pages/todo/todo_item.dart';
import 'package:mtodolist/utils/ext/context.dart';

import '../../ui.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {

  late TodoBloc _todoBloc;

  final TextEditingController _newTodoController = TextEditingController();

  final List<TodoData> _todos = [];

  @override
  void initState() {
    super.initState();
    _todoBloc = BlocProvider.of(context);
    _todoBloc.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, Result<List<TodoData>>>(
      bloc: _todoBloc,
      listener: (context, state){
        if(state.status == Status.success){
          setState(() {
            _todos.addAll(state.data ?? []);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.get.todoList,
            style: const TextStyle(
              color: Palette.white
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteCompletedTask,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNewTask,
          child: const Icon(Icons.add),
        ),
        body: _buildMain(),
      ),
    );
  }

  Widget _buildMain(){
    if(_todos.isEmpty){
      return Error(
        errorMessage: Strings.get.todoEmpty,
      );
    }
    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index){
        return TodoItem(
          todoData: _todos[index],
          onTap: (){
            setState(() {
              _todoBloc.update(_todos[index]);
            });
          },
        );
      },
    );
  }

  Future<void> _addNewTask() async {
    await context.dialog(
        title: Strings.get.addNewTodoTitle,
        child: SizedBox(
          width: context.widthInPercent(100),
          child: TextFormField(
            decoration: InputDecoration(
                hintText: Strings.get.addNewTodoHint
            ),
            controller: _newTodoController,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final todo = await _todoBloc.saveData(_newTodoController.text);
              if(todo != null){
                _todos.add(todo);
              }
              _newTodoController.clear();
            },
            child: Text(
              Strings.get.add,
              style: TextStyles.body1.copyWith(
                color: Palette.primary,
              ),
            ),
          ),
        ]
    );
  }

  void _deleteCompletedTask(){
    context.dialogConfirm(
        title: Strings.get.deleteCompleteTask,
        message: Strings.get.deleteCompleteConfirm,
        onActionNo: context.dismiss,
        onActionYes: (){
          _todoBloc.deleteCompleteTask();
          setState(() {
            _todos.removeWhere((element) => element.isComplete ?? false);
          });
        }
    );
  }
}
