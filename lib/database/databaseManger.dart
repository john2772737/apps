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
        // Insert test users after the table is created
        insertTestUsers(db);
      });
    });
  }

  // Insert multiple test users into the database
  Future<void> insertTestUsers(Database db) async {
    List<Map<String, dynamic>> users = [
      {
        'fullName': 'John Regulacion',
        'email': 'johnregulacion@gmail.com',
        'phoneNo': '1234567890',
        'jobPosition': 'Developer',
        'school': 'Don Honorio Ventura State University',
        'birthdate': '1990-01-01',
        'address': '123 Main St',
        'password': 'john1026',
        'imageUrl': 'https://drive.google.com/uc?id=1CUX_Ne8oxKWYn5u42OzSyWs5N6cRdiOd',
      },
      {
        'fullName': 'Angelaine Sampang',
        'email': 'sampangangelaine@gmail.com',
        'phoneNo': '09450000538',
        'jobPosition': 'Developer',
        'school': 'Don Honorio Ventura State University',
        'birthdate': '2004-03-10',
        'address': '123 Main St',
        'password': 'angel0310',
        'imageUrl': 'https://drive.google.com/uc?id=1WzcHYipQS7Avx_BB0ZJb78Oz61IX5i-W',
      },
      {
        'fullName': 'Jada Ilagan',
        'email': 'ilaganjada2@gmail.com',
        'phoneNo': '09971546088',
        'jobPosition': 'Developer',
        'school': 'Don Honorio Ventura State University',
        'birthdate': '2004-08-18',
        'address': 'Candaba, Pampanga',
        'password': 'ilaganjadab',
        'imageUrl': 'https://drive.google.com/uc?id=1PuHpbQ4CGRESlLQn9-LoIqnRmPlmzvdc',
      },
      {
        'fullName': 'Ralph Laurence F. De Guzman',
        'email': 'deguzmanralphlaurence27@gmail.com',
        'phoneNo': '09991794230',
        'jobPosition': 'UI/UX Designer',
        'school': 'Don Honorio Ventura State University',
        'birthdate': '2002-11-27',
        'address': '1989 Cornelia Street',
        'password': 'saRap123',
        'imageUrl': 'https://drive.google.com/uc?id=19-PTZ-Tpbg1eVp3iS8yY1G3lHXCq9pGT',
      },
    ];

    // Insert each user into the database
    for (var user in users) {
      await db.insert('users', user);
    }
  }

  // Fetch user by ID
  Future<UserModel?> getUserById(int userId) async {
    final db = await database;

    var res = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (res.isNotEmpty) {
      return UserModel.fromJson(res.first);
    } else {
      return null;
    }
  }

  // Validate user login with email and password
  Future<int?> validateUser(String email, String password) async {
    final db = await database;

    var result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first['id'] as int?;
    } else {
      return null;
    }
  }
}
