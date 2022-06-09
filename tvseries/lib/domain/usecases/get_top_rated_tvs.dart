import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class GetTopRatedTvs {
  final TvsRepository repository;

  GetTopRatedTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute() {
    return repository.getTopRatedTvs();
  }
}