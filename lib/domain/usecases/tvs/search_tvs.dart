import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';

class SearchTvs {
  final TvsRepository repository;

  SearchTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute(String query) {
    return repository.searchTvs(query);
  }
}
