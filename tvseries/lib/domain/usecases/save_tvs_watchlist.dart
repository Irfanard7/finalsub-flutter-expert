import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class SaveTvsWatchlist {
  final TvsRepository repository;

  SaveTvsWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvsDetail tvs) {
    return repository.saveWatchlist(tvs);
  }
}
