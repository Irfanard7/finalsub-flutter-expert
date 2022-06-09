import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class GetTvsRecommendations {
  final TvsRepository repository;

  GetTvsRecommendations(this.repository);

  Future<Either<Failure, List<Tvs>>> execute(int id) {
    return repository.getTvsRecommendations(id);
  }
}
