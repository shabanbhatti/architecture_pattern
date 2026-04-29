import 'package:api_integration/model/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CommonLocalDatabaseService {
  static CommonLocalDatabaseService?
  commonLocalDatabaseServicelocalDatabaseService;
  CommonLocalDatabaseService._();

  factory CommonLocalDatabaseService() {
    commonLocalDatabaseServicelocalDatabaseService ??=
        CommonLocalDatabaseService._();
    return commonLocalDatabaseServicelocalDatabaseService!;
  }

  Future<Database> get getDatabase async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, "notepad_app.db"),
      onCreate: (db, version) {
        db.execute(NotesModel.createTable);
      },
      version: 1,
    );
    return db;
  }
}
