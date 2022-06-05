import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tvs/tvs_detail.dart';
import 'package:ditonton/domain/repositories/tvs_repository.dart';

class GetTvsDetail {
  final TvsRepository repository;

  GetTvsDetail(this.repository);

  Future<Either<Failure, TvsDetail>> execute(int id) {
    return repository.getTvsDetail(id);
  }
}
