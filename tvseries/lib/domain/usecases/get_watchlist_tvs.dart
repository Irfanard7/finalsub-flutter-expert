import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class GetWatchlistTvs {
  final TvsRepository repository;

  GetWatchlistTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute() {
    return repository.getWatchlistTvs();
  }
}