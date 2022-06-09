import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class GetPopularTvs {
  final TvsRepository repository;

  GetPopularTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute() {
    return repository.getPopularTvs();
  }
}