import 'package:api_integration/model/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  static LocalDatabaseService? localDatabaseService;
  LocalDatabaseService._();

  factory LocalDatabaseService() {
    localDatabaseService ??= LocalDatabaseService._();
    return localDatabaseService!;
  }

  Future<Database> get getDatabase async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, "user.db"),
      onCreate: (db, version) {
        db.execute(NotesModel.createTable);
        
      },
      version: 1,
    );
    return db;
  }





}
