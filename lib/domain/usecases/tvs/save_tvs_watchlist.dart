import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';

class SaveTvsWatchlist {
  final TvsRepository repository;

  SaveTvsWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvsDetail tvs) {
    return repository.saveWatchlist(tvs);
  }
}
