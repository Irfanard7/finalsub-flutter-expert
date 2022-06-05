import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';

class RemoveTvsWatchlist {
  final TvsRepository repository;

  RemoveTvsWatchlist(this.repository);

  Future<Either<Failure, String>> execute(TvsDetail tvs) {
    return repository.removeWatchlist(tvs);
  }
}
