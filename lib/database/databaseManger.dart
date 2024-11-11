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
      // Create the users table
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
          password TEXT,
          imageUrl TEXT
        )
        ''',
      ).then((_) {
        // Insert a test user after the table is created
        insertTestUser(db);
      });
    });
  }

  // Insert a test user into the database for login testing
  Future<void> insertTestUser(Database db) async {
    await db.insert('users', {
      'fullName': 'John Doe',
      'email': 'johnregulacion@gmail.com',
      'phoneNo': '1234567890',
      'jobPosition': 'Developer',
      'school': 'Don honorio State University',
      'birthdate': '1990-01-01',
      'address': '123 Main St',
      'password': 'john1026', // For real applications, you should hash the password
      'imageUrl': 'https://example.com/images/john_doe.png',
    });
  }

  // Fetch users from the database
  Future<List<UserModel>> getUsers() async {
    final db = await database;
    var res = await db.query('users');
    return res.isNotEmpty
        ? res.map((user) => UserModel.fromJson(user)).toList()
        : [];
  }

  // Validate user login with email and password
  Future<int?> validateUser(String email, String password) async {
    final db = await database;

    var result = await db.query('users',
        where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (result.isNotEmpty) {
      return result.first['id'] as int?; // Return the id of the user found
    } else {
      return null; // Return null if no matching user is found
    }
  }
}


