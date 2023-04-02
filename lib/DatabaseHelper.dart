import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import './models/Book.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

factory DatabaseHelper() {
    return _instance;
  }
  static Database? _db = null;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper._internal();


initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "bookstore.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

 void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE panier(id INTEGER PRIMARY KEY, title TEXT, author TEXT, coverUrl TEXT, description TEXT,averageRating DOUBLE, prix DOUBLE, quantite INTEGER)");
    await db.execute(
        "CREATE TABLE commande(idc INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, total REAL)");
  }

 Future<int> saveBook(Book book) async {
    var dbClient = await db;
    int res = await dbClient.insert("panier", book.toMap());
    return res;
  }
Future<int> saveCmd(String desc, double tot) async {
    var dbClient = await db;
    Map<String, dynamic> cmap = {
      'description': desc,
      'total': tot,
    };
    int res = await dbClient.insert("commande", cmap);
    return res;
  }

  Future<List<Book>>getBooks() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM panier');
    List<Book> books = [];
    for (var i = 0; i < list.length; i++) {
      var book = Book(
          id: list[i]["id"],
          title: list[i]["title"],
          author: list[i]["author"],
          coverUrl: list[i]["coverUrl"],
          description: list[i]["description"],
          averageRating: list[i]["averageRating"],
          prix: list[i]["prix"],
          quantite: list[i]["quantite"]);
      books.add(book);
    }
    return books;
  }

  Future<int> deleteBook(int id) async {
    var dbClient = await db;
    int res = await dbClient.delete("panier", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> updateBook(Book book) async {
    var dbClient = await db;
    int res = await dbClient
        .update("panier", book.toMap(), where: "id = ?", whereArgs: [book.id]);
    return res;
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    int res = await dbClient.delete("panier");
    return res;
  }

  Future<int> deleteAllCommande() async {
    var dbClient = await db;
    int res = await dbClient.delete("commande");
    return res;
  }

  Future<List<Map<String, dynamic>>> getAllCommands() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient.rawQuery('SELECT * FROM commande');
    return list;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
   static DatabaseHelper get instance => _instance;
}


