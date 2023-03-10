import 'package:mtodolist/core/core.dart';
import 'package:sqflite/sqflite.dart';

class TodoRepository {
  static const tableName = "todo";
  static const columnId = "id";
  static const columnNote = "note";
  static const columnIsComplete = "is_complete";
  static const columnCreatedAt = "created_at";
  static const columnCompletedAt = "completed_at";
  late Database db;

  Future open() async {
    var databasesPath = await getDatabasesPath();
    db = await openDatabase("${databasesPath}demo.db", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      create table $tableName ( 
        $columnId integer primary key autoincrement, 
        $columnNote text not null,
        $columnIsComplete integer(1) not null,
        $columnCreatedAt text null,
        $columnCompletedAt text null)
      ''');
    });
  }

  Future<TodoData> insert(TodoData todo) async {
    await db.insert(tableName, {
      columnNote: todo.note,
      columnIsComplete: todo.isComplete ?? false ? 1 : 0,
      columnCreatedAt: todo.createdAt
    });
    return todo;
  }

  Future<TodoData> update(TodoData todo) async {
    await db.update(tableName, {
      columnNote: todo.note,
      columnIsComplete: todo.isComplete ?? false ? 1 : 0,
      columnCreatedAt: todo.createdAt
    }, where: '$columnId = ?', whereArgs: [todo.id]);
    return todo;
  }

  Future<List<TodoData>> getAll() async {
    List<Map<String, dynamic>> maps = await db.query(tableName,
        columns: [columnId, columnNote, columnIsComplete, columnCreatedAt, columnCompletedAt],
    );

    List<TodoData> todos = [];
    for(final map in maps){
      todos.add(TodoData.fromJson(map));
    }
    return todos;
  }

  Future<int> deleteComplete() async {
    return await db.delete(tableName, where: '$columnIsComplete = 1');
  }

  Future close() async => db.close();
}
