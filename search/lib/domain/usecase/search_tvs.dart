import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class SearchTvs {
  final TvsRepository repository;

  SearchTvs(this.repository);

  Future<Either<Failure, List<Tvs>>> execute(String query) {
    return repository.searchTvs(query);
  }
}
