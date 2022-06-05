import 'package:ditonton/data/models/tvs/tvs_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperTvs {
  static DatabaseHelperTvs? _databaseHelperTvs;
  DatabaseHelperTvs._instance() {
    _databaseHelperTvs = this;
  }

  factory DatabaseHelperTvs() =>
      _databaseHelperTvs ?? DatabaseHelperTvs._instance();

  static Database? _databaseTvs;

  Future<Database?> get databaseTvs async {
    if (_databaseTvs == null) {
      _databaseTvs = await _initDb();
    }
    return _databaseTvs;
  }

  static const String _tblWatchlistTvs = 'watchlistTvs';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditontonTvs.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlistTvs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertWatchlistTvs(TvsTable tvs) async {
    final db = await databaseTvs;
    return await db!.insert(_tblWatchlistTvs, tvs.toJson());
  }

  Future<int> removeWatchlistTvs(TvsTable tvs) async {
    final db = await databaseTvs;
    return await db!.delete(
      _tblWatchlistTvs,
      where: 'id = ?',
      whereArgs: [tvs.id],
    );
  }

  Future<Map<String, dynamic>?> getTvsById(int id) async {
    final db = await databaseTvs;
    final results = await db!.query(
      _tblWatchlistTvs,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTvs() async {
    final db = await databaseTvs;
    final List<Map<String, dynamic>> results =
        await db!.query(_tblWatchlistTvs);

    return results;
  }
}
