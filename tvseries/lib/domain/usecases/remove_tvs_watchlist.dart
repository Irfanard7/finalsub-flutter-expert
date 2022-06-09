import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class RemoveTvsWatchlist {
  final TvsRepository repository;

  RemoveTvsWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvsDetail tvs) {
    return repository.removeWatchlist(tvs);
  }
}
