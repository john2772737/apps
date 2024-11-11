import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../blocs/bloc/user_model.dart'; // Import the generated user model

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        '''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          fullName TEXT,
          email TEXT,
          phoneNo TEXT,
          jobPosition TEXT,
          school TEXT,
          birthdate TEXT,
          address TEXT,
          imageUrl TEXT
        )
        ''',
      );
    });
  }

  Future<List<UserModel>> getUsers() async {
    final db = await database;
    var res = await db.query('users');
    return res.isNotEmpty
        ? res.map((user) => UserModel.fromJson(user)).toList()
        : [];
  }

  Future<int> insertUser(UserModel user) async {
    final db = await database;
    return await db.insert('users', user.toJson());
  }

  // Check if a user exists with the given email and password
  Future<int?> validateUser(String email, String password) async {
    final db = await database;

    var result = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (result.isNotEmpty) {
      return result.first['id']
          as int?; // Return the id of the first user found
    } else {
      return null; // Return null if no matching user is found
    }
  }
}
