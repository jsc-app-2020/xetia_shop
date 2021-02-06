import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model/user.dart';

class UserProvider {
  static const String TABLE = "user";
  static const String COLUMN_ID = "id";
  static const String ROLE_NAME = "role_name";
  static const String ROLE_DESCRIPTION = "role_description";
  static const String ENTITY_TYPE = "entity_type";
  static const String ENTITY_ID = "entity_id";
  static const String ENTITY_NAME = "entity_name";
  static const String USER_ID = "user_id";
  static const String FIRST = "first";
  static const String LAST = "last";
  static const String PHOTO = "photo";
  static const String ROLE = "role";
  static const String REFRESH_TOKEN = "refresh_token";
  static const String ACCESS_TOKEN = "access_token";
  static const String SUBCRIPTION_TOKEN = "subcription_token";

  UserProvider._();

  static final UserProvider db = UserProvider._();

  Database _database;

  Future<Database> get database async {
    print("database called");

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(join(dbPath, 'userDB.db'), version: 1,
        onCreate: (Database database, int version) async {
      print("create table");

      await database.execute(
        "CREATE TABLE $TABLE ("
        "$COLUMN_ID INTEGER PRIMARY KEY,"
        "$ROLE_NAME TEXT,"
        "$ROLE_DESCRIPTION TEXT,"
        "$ENTITY_TYPE TEXT,"
        "$ENTITY_ID TEXT,"
        "$ENTITY_NAME TEXT,"
        "$FIRST TEXT,"
        "$LAST TEXT,"
        "$PHOTO TEXT,"
        "$USER_ID TEXT,"
        "$REFRESH_TOKEN TEXT,"
        "$ACCESS_TOKEN TEXT,"
        "$SUBCRIPTION_TOKEN TEXT,"
        "$ROLE INTEGER"
        ")",
      );
    });
  }

  Future<User> getUser() async {
    final db = await database;

    var user = await db.query(TABLE, columns: [
      COLUMN_ID,
      ROLE_NAME,
      ROLE_DESCRIPTION,
      ENTITY_TYPE,
      ENTITY_ID,
      ENTITY_NAME,
      FIRST,
      LAST,
      PHOTO,
      USER_ID,
      REFRESH_TOKEN,
      ACCESS_TOKEN,
      SUBCRIPTION_TOKEN,
      ROLE
    ]);

    List<User> userList = List<User>();

    user.forEach((currentUser) {
      User user = User.fromMap(currentUser);
      userList.add(user);
    });

    return userList[0];
  }

  Future<User> insertUser(User user) async {
    print("insert data");

    final db = await database;

    user.id = await db.insert(TABLE, user.toMap());
    return user;
  }

  Future<int> deleteUser(int id) async {
    print("delete data");

    final db = await database;

    return await db.delete(TABLE, where: "id = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    print("update data");

    final db = await database;

    return await db
        .update(TABLE, user.toMap(), where: "id = ?", whereArgs: [user.id]);
  }
}
