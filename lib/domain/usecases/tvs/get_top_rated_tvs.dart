import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvs/tvs.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';

class GetTopRatedTvs {
  final TvsRepository repository;

  GetTopRatedTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute() {
    return repository.getTopRatedTvs();
  }
}