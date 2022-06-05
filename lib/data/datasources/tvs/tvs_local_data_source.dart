import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper_tvs.dart';
import 'package:ditonton/data/models/tvs/tvs_table.dart';

abstract class TvsLocalDataSource {
  Future<String> insertWatchListTvs(TvsTable tvs);
  Future<String> removeWatchListTvs(TvsTable tvs);
  Future<TvsTable?> getTvsById(int id);
  Future<List<TvsTable>> getWatchListTvs();
}

class TvsLocalDataSourceImpl implements TvsLocalDataSource {
  final DatabaseHelperTvs databaseHelperTvs;

  TvsLocalDataSourceImpl({required this.databaseHelperTvs});

  @override
  Future<TvsTable?> getTvsById(int id) async {
    final result = await databaseHelperTvs.getTvsById(id);
    if (result != null) {
      return TvsTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvsTable>> getWatchListTvs() async {
    final result = await databaseHelperTvs.getWatchlistTvs();
    return result.map((e) => TvsTable.fromMap(e)).toList();
  }

  @override
  Future<String> insertWatchListTvs(TvsTable tvs) async {
    try {
      await databaseHelperTvs.insertWatchlistTvs(tvs);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchListTvs(TvsTable tvs) async {
    try {
      await databaseHelperTvs.removeWatchlistTvs(tvs);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
