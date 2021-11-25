import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db_model.dart';

class StudentHandler extends GetxController{

  Future<Database> initializeDB() async{
    String dbPath = await getDatabasesPath();
    return openDatabase(join(dbPath, "student.db"),
    version: 1,
      onCreate: (database, version) async{
      await database.execute(
        "CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT,studentNamedb TEXT NOT NULL,studentClassdb TEXT NOT NULL, studentDivdb TEXT NOT NULL,studentAgedb TEXT NOT NULL, studentGenderdb TEXT NOT NULL,studentAddressdb TEXT NOT NULL )"
      );
      }
    );
  }

  Future<int> insertStudents(List<Students> student) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var element in student) {
      result = await db.insert('students', element.toMapForDB());
      print('studentssss result:$result');
    }
    return result;
  }

  Future<List<Students>> retrieveStudents() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('students');
    return queryResult.map((e) => Students.fromMap(e)).toList();
  }

  Future<void> deleteStudents(int id) async {
    final db = await initializeDB();
    await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('song deleted');
  }



  Future<int> updateStudent(int? id, String sName, String sClass,String sDiv, String sAge,
      String sGender, String sAddress) async {
    final db = await initializeDB();
    print('heloooooooooooooooooooooooooooooooooooo${[sName,sClass,sDiv,sAge,sGender,sAddress]}');
    final data = {'studentNamedb': sName,'studentClassdb':sClass, 'studentDivdb': sDiv, 'studentAgedb': sAge, 'studentGenderdb': sGender,'studentAddressdb': sAddress};
    final result =
    await db.update('students', data, where: "id = ?", whereArgs: [id]);
    return result;
  }


}

