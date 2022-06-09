import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:tvseries/tvseries.dart';

class GetTvsDetail {
  final TvsRepository repository;

  GetTvsDetail(this.repository);

  Future<Either<Failure, TvsDetail>> execute(int id) {
    return repository.getTvsDetail(id);
  }
}
