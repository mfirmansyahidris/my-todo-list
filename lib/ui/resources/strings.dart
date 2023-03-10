import 'package:mtodolist/utils/ext/string.dart';

class Strings {
  Strings._();

  static Strings get = Strings._();

  /// Clear strings after change language
  static void clear() {
    get = Strings._();
  }

  String appName = "My Todo List";

  String createdBy = "createdBy".toLocale();
  String creator = "creator".toLocale();

  String todoList = "todoList".toLocale();
  String addNewTodoTitle = "addNewTodoTitle".toLocale();
  String addNewTodoHint = "addNewTodoHint".toLocale();
  String add = "add".toLocale();
  String deleteCompleteTask = "deleteCompleteTask".toLocale();
  String deleteCompleteConfirm = "deleteCompleteConfirm".toLocale();
  String yes = "yes".toLocale();
  String cancel = "cancel".toLocale();
  String todoEmpty = "todoEmpty".toLocale();

}
