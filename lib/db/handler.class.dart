import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'model_class.dart';

class StudentHandler extends GetxController{
  Future<Database> initializeDB() async {
    final String dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'studentlist.db'),
      version: 1,
      onCreate: (
        database,
        version,
      ) async {
        print('CreatingList');
        await database.execute(
            'CREATE TABLE students(id INTEGER PRIMARY KEY,studentName TEXT NOT NULL,studentClass TEXT NOT NULL,studentAge TEXT NOT NULL,studentGender TEXT NOT NULL,studentAddress TEXT NOT NULL )');
      },
    );
  }

  Future<int> insertStudent(List<StudentsModel> students) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var student in students) {
      result = await db.insert('students', student.toMap());
    }
    return result;
  }

  Future<List<StudentsModel>> retrieveStudentList() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('students');
    return queryResult.map((e) => StudentsModel.fromMap(e)).toList();
  }

  // Future<dynamic> updateStudent(String name,String sClass,String age,String gender,String address) async {
  //   final db = await initializeDB();
  //   var std = await db.update("students", student.toMap(),
  //       where: "id = ?", whereArgs: [student.id]);
  //   return std;
  // }

  Future<int> updateStudent(int id,String name,String sClass,String age,String gender,String address) async {
    final db = await initializeDB();

    final data = {
      'name': name, 'age': age, 'place': gender, 'email': address
    };

    final result = await db.update('students', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<void> deleteStudent(int num) async {
    final db = await initializeDB();
    await db.delete('students', where: 'id = ?', whereArgs: [num]);
  }
}
