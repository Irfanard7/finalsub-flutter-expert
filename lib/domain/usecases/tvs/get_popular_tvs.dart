import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';

class GetPopularTvs {
  final TvsRepository repository;

  GetPopularTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute() {
    return repository.getPopularTvs();
  }
}